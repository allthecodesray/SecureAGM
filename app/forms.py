'''
Created on Nov 19, 2017

@author: Raymond O'Connor <x16137981@student.ncirl.ie>
'''
from flask_wtf import Form
from wtforms import StringField, PasswordField, SubmitField,RadioField,HiddenField
from wtforms.validators import Email, DataRequired

class LogInForm(Form):
    email = StringField('email',validators=[DataRequired(),Email()])
    password = PasswordField('password',validators=[DataRequired()])
    submit = SubmitField("Log In")
    
class VoteForm(Form):
   # picker = RadioField('Label', choices=[], coerce=int,validators=[DataRequired()])
    picker = RadioField('Label', choices=[], coerce=int)
    submit = SubmitField("Cast Vote")
    cancel = SubmitField("Go To Agenda")