'''
Created on Nov 19, 2017

@author: Raymond O'Connor <x16137981@student.ncirl.ie>
'''

from flask_login import UserMixin

class Voter(UserMixin):


    def __init__(self, vid, email):
        self.vid=vid
        self.email=email

    
    def __repr__(self):
        return "%r/%s" % (self.vid,self.email)
    
    def get_id(self):
        return str(self.vid)
    