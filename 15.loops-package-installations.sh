#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo "$R login with root user privilege $N"
    exit 1
else
    echo "$G successfully logged in as root user"$N
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.... $R FAILURE $N"
        exit 1
    else
        echo "$2.... $G SUCCESS $N"
    fi
}

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then    
        echo "$R $package not installed, going to install $N"
        dnf install $package -y
        VALIDATE $? "installng $package"
    else
        echo "$G $package is already installed, nothing to do $N"
    fi
done