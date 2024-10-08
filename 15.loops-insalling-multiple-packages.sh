#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R login with root user privilege $N" &>>LOG_FILE
    exit 1
else
    echo -e "$G successfully logged in as root user"$N &>>LOG_FILE
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e  "$2.... $R FAILURE $N" &>>LOG_FILE
        exit 1
    else
        echo -e "$2.... $G SUCCESS $N" &>>LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>>LOG_FILE
    if [ $? -ne 0 ]
    then    
        echo -e "$R $package not installed, going to install $N" &>>LOG_FILE
        dnf install $package -y
        VALIDATE $? "installng $package"
    else
        echo -e "$Y $package is already installed, nothing to do $N" &>>LOG_FILE
    fi
done