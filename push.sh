#!/bin/bash

#file pull.sh
#Lab 9 Scheduled Tasks
#date 11/1/2020


#Constants
AWSHOST="ec2-54-165-154-204.compute-1.amazonaws.com"
AWSUSER="push-web"
LOCALDIR="web-content"

#Change to working directory
cd /root/cron-lab
#Rsync
rsync -e "ssh -i keys/push-web" -vraO --no-perms --delete --chmod=660 --chown=push-web:www-data "${LOCALDIR}/" "${AWSUSER}@${AWSHOST}":
# Syslog
logger -t $0 "web content pushed to ${AWSHOST}"

