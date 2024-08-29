#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo -e "$R Please login with root privelege $N"
    exit 1
else
    echo -e "$G Logged as root user successfully $N"
fi


