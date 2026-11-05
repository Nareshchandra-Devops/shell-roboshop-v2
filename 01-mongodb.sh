#!/bin/bash

source ./common.sh

check_root

cp mongo.repo /etc/yum.repos.d/mongo.repo
validate $? "Adding mongo repo"

dnf install mongodb-org -y &>> $logs_file
validate $? "Install MongoDB"

systemctl enable mongodb &>> $logs_file
systemctl start mongodb &>> $logs_file
validate $? "Enable and start MongoDB"