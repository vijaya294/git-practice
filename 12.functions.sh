#!/bin/bash

USERID=$(id -u)   #echo "user id is : $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed"
        exit 1
    else
        echo "$2 is success"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "you are not the root user, please log in as root user"
    exit 1
fi

dnf list installed git

VALIDATE $? "listing git"

if [ $? -ne 0 ]
then 
    echo "git is not installed, going to install it"

    dnf install git -y
   
    VALIDATE $? "installing git"

else
    echo "git is already installed, nothong to do"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed"

    dnf install mysql -y

    VALIDATE $? "installing mysql"
    
else 
    echo "mysql is already installed"
fi



# output :

# Installed Packages
# git.x86_64                        2.43.0-1.el9                         @rhel-9-appstream-rhui-rpms
# listing git is success
# git is already installed, nothong to do
# Error: No matching Packages to list
# mysql is not installed

# Complete!
# installing mysql is success
