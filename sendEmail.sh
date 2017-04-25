#!/bin/bash
###############################################################################
####################--WRITTEN BY DANIEL MAGEVSKI--#############################
###############################################################################
EMAIL_FROM="email@email.com"  #USER E-MAIL WITH SMTP AUTHENTICATION
EMAIL_TO="email@email.com" #USER THAT WILL RECEIVE EMAIL
SERVER_SMTP="smtp.email.com" #SERVER WITH PORT
PORT="00"
PASSWORD="PASSWORD" #PASSWORD
SUBJECT="SUBJECT" #SUBJECT
MENSSAGE="MESSAGE" #MESSAGE

sendEmail -f $EMAIL_FROM -t $EMAIL_TO -u "$SUBJECT" -m "$MENSSAGE" \
-s $SERVER_SMTP:$PORT -xu $EMAIL_FROM -xp $PASSWORD \
