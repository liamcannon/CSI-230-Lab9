#!/bin/bash

#file pull.sh
#Lab 9 Scheduled Tasks
#date 11/1/2020


#Constants
AWSHOST="ec2-54-165-154-204.compute-1.amazonaws.com"
AWSUSER="pull-log"
LOCALDIR="apache-logs"

#Change to working directory
cd /home/liamcannon/cron-lab

#Rsync
rsync -e "ssh -i keys/pull-log" -av "${AWSUSER}@{ASWHOST}:" ${LOCALDIR}

# Syslog
logger -t $0 "apache logs pulled from ${AWSHOST}"

