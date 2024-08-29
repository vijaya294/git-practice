#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "please log in with root privilege"
else
    echo "logged in as root user successfully"
    exit 1
fi

dnf list install mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed yet, will start install"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then    
        echo "mysql installation is a falure"
    else
        echo "mysql installation is success"
    fi
echo "mysql is installed successfully"
fi






















# #!/bin/bash

# USERID=$(id -u)   #echo "user id is : $USERID"

# if [ $USERID -ne 0 ]
# then 
#     echo "please log in as root user"
#     exit 1
# fi

# dnf list installed git

# if [ $? -ne 0 ]
# then 
#     echo "git is not installed, going to install it"

#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "git installation is not success"
#         exit 1
#     else
#         echo "git installation is success"
#     fi

# else
#     echo "git is already installed, nothong to do"
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "mysql is not installed"

#     dnf install mywal -y
#     if [ $? -ne 0 ]
#     then 
#         echo "mysql installation is failure"
#         exit 1
#     else 
#         echo "mysql installation is success"
#     fi

# else 
#     echo "mysql is already installed"
# fi

