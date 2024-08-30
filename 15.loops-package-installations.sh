#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "login with root user privilege"
else
    echo "successfully logged in as root user"
fi




























# USERID=$(id -u)

# R="\e[31m"
# G="\e[32m"
# N="\e[0m"

# if [ $USERID -ne 0 ]
# then 
#     echo -e "$R Please login with root privelege $N"
#     exit 1
# else
#     echo -e "$G Logged as root user successfully $N"    #o/p  :  Logged as root user successfully

# fi

# VALIDATE(){
#     if [ $1 -ne 0 ]
#     then 
#         echo "$2.... FAILED"
#         exit 1
#     else
#         echo "$2.... SUCCESS"
#     fi
# }

# for package in $@
# do
    

