#!/bin/bash
###################################################
###################################################
####--Export backup of your SonicWall by FTP--#####
###################################################
#########--WRITEN BY DANIEL MAGEVSKI--#############
###################################################
###################################################
#Directory for the log
LOG=""
DATE_TIME_UNDERLINE=$(date +%d"-"%m"-"%y"_"%H"-"%M)
DATE_TIME_PIPE=$(date +%d"-"%m"-"%y"|"%H":"%M)

#User to log into the Sonicwall
login=""
# Password of the Sonicwall
password=""
#IP of the Sonicwall
host=""
port=""

/usr/bin/expect <<EOF
spawn ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no $login@$host -p $port
expect -re ".*?assword:"
send "$password\n"
expect -re ">"
send "export current-config sonicos ftp ftp://user:password@0.0.0.0/name_$DATE_TIME_UNDERLINE.exp\n"
expect -re ">"
send "exit"
EOF

if [ $? -eq 0 ] ; then

             echo " $DATE_TIME_PIPE $host BACKUP HAS BEEN SUCCESSFULLY" >> $LOG;
else

             echo "$DATE_TIME_PIPE - $host BACKUP ERROR" >> $LOG ;
fi
done
