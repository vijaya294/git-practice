#!/bin/bash

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER 


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R login with root user privilege $N" | tee -a LOG_FILE
    exit 1
else
    echo -e "$G successfully logged in as root user"$N | tee -a LOG_FILE
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e  "$2.... $R FAILURE $N" | tee -a LOG_FILE
        exit 1
    else
        echo -e "$2.... $G SUCCESS $N" | tee -a LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE :: sudo sh 16.redirectors.sh package1 package2 ...$N" | tee -a LOG_FILE
    exit 1
}

echo -e "$G script executed date and time is : $(date) $N" | tee -a LOG_FILE


if [ $# -eq 0 ]    #here $# means to kow how many arguments are there in a file
then
    USAGE
fi

for package in $@
do
    dnf list installed $package &>>LOG_FILE
    if [ $? -ne 0 ]
    then    
        echo -e "$R $package not installed, going to install $N" | tee -a LOG_FILE
        dnf install $package -y
        VALIDATE $? "installng $package"
    else
        echo -e "$Y $package is already installed, nothing to do $N" | tee -a LOG_FILE
    fi
done