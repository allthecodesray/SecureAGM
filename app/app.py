'''
Created on Oct 29, 2017

@author: Raymond O'Connor <x16137981@student.ncirl.ie>
'''
#app.py
from flask import Flask, render_template, request, json, redirect,url_for,Response, flash,session
from flask.ext.mysql import MySQL
from flask_login import LoginManager, login_user, login_required, logout_user, login_manager,current_user
from forms import VoteForm, LogInForm
from models import Voter
import re
import datetime
from wtforms import form
from werkzeug import generate_password_hash, check_password_hash
from flask_bootstrap import Bootstrap

app = Flask(__name__)


mysql = MySQL()
app.config.from_pyfile('config.cfg')

mysql.init_app(app)
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'
conn = mysql.connect()
cursor = conn.cursor()
Bootstrap(app)

@login_manager.user_loader
def load_user(vid):
    
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.callproc('GetByVoterID',(vid,))
        results=cursor.fetchall()
        
    finally:
        conn.commit()
        user = Voter(results[0][0],results[0][1])
        conn.close()
        return user

@app.before_request
def before_request():
    session.permanent = True
    app.permanent_session_lifetime = datetime.timedelta(minutes=20)
    session.modified = True
    user = current_user

@app.route("/")
def index():
    return redirect(url_for('login'))

@app.route("/login",methods=['GET','POST'])
def login():
    form = LogInForm()
    
    if request.method == 'GET':
        return render_template('login.html', form=form)
    elif request.method == 'POST':
        if form.validate_on_submit():
            try:
                conn = mysql.connect()
                cursor = conn.cursor()
                cursor.callproc('ValidateLogin',(form.email.data,))
                rv=cursor.fetchall()
                
            finally:
                conn.commit()
                conn.close()
                print len(rv)
                if len(rv) != 0:
               
                    if check_password_hash(str(rv[0][2]),form.password.data):
                        voter = Voter(rv[0][0],rv[0][1])
                        login_user(voter)
                        return redirect(url_for('showAGMs'))                
                    else:
                        return "Wrong password"            
                else:
                    return "user doesn't exist"
            
        else:
            return "form not validated"        
    else:
            return "form not validated"

@app.route("/showAGMs")
@login_required
def showAGMs():
    
    ids = []
    a_fields = []
    
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.callproc('showVoterAGMs')
        rv=cursor.fetchall()
        
    finally:
        conn.commit()
        conn.close()
        
    for row in rv:
        ids.append(row[0])
        a_fields.append(row[1:5])
    
    return render_template("agm_list.html", data=a_fields, ids=ids)

@app.route("/showAgenda")
@login_required
def showAgenda():
    
    b_keys = []
    b_fields = []
    if 'showAGMs' in request.referrer:
        agm_key = request.args.get('key')
        mname = request.args.get('mtitle')
        session['agm'] = agm_key
        session['a_title'] = mname
    else:
        agm_key = session.get('agm')
        mname = session.get('a_title')
    try:
        conn = mysql.connect()
        cursor = conn.cursor()    
        cursor.callproc('GetBallots',(agm_key,))
        rv=cursor.fetchall()
    finally:
        conn.commit()
        conn.close()
    for row in rv:
        b_keys.append(row[0])
        b_fields.append(row[1:4])
        
    return render_template("ballot_list.html",mtitle=mname,data=b_fields,ids=b_keys)

@app.route("/displayVoteForm")
def displayVoteForm():

    
    coll = []
    b_id = request.args.get('key')
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        session['ballot'] = b_id
        cursor.callproc('SelectBallotAndChoices',(b_id,))
        data=cursor.fetchall()
        
    finally:
        conn.commit()
        conn.close()
        
    bname=data[0][0]
    prop=data[0][1]
        
    #if len(form.picker.choices) == 0:
    
    for result in data:
        coll.append((result[2],result[3]))
         #   form.picker.choices.set_default(result[2])
        
    print coll
    form = VoteForm()
    form.picker.choices=coll
    return render_template("votenow.html", ballot_name=bname,proposal_text=prop,form=form )
    


@app.route("/castVote",methods=['POST'])
def castVote():
    
    form = VoteForm()
    print form.errors
    voteExists = False
    
    #if form.validate_on_submit():
        
        #print form.cancel.data
    if form.submit.data:
        op_select = form.picker.data
        bal_id = session.get('ballot')
        
        try:
            conn = mysql.connect()
            cursor=conn.cursor()
            cursor.callproc('checkForVote',(bal_id,current_user.vid))
            data=cursor.fetchall();
            
            if len(data) is 0:
                cursor.callproc('RecordVote',(bal_id,current_user.vid,op_select))
                data=cursor.fetchall()
                
            else:
                voteExists = True
                
                    
        finally:

        
            conn.commit()
            conn.close()
            
            if not voteExists:
                flash("Your vote was successfully recorded..")   
                
            else:
                flash("You have already voted for this ballot!")
                
            return redirect(url_for('displayVoteForm',key=bal_id))
        
    elif form.cancel.data:
        return redirect(url_for('showAGMs'))
        
    #else:
      #  return "form not validated"
       # print form.errors      

@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))            
