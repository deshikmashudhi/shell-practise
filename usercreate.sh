#!/bin/bash
#create user and give sudo access and validate it using functions
#commands in linux is user add 

R="\e[31m"
G="\e[32m"
N="\e[0m"

create_user() {
    USERNAME=$1

    if id "$USERNAME" &>/dev/null;
    then
        echo -e " User $G $USERNAME $N already exists "
    else
        sudo useradd -m "$USERNAME"
        if [ $? -eq 0 ]
        then 
            echo -e "user $G $USERNAME $N created"
        else
            echo -e "user $R $USERNAME $N not created"
        exit 1
        fi
        sudo usermod -aG sudo "$USERNAME"
        if [ $? -eq 0 ]
        then
            echo -e "user $G $USERNAME $N sudo acess granted"
        else
            echo -e "user $R $USERNAME $N sudo acess not granted"
        fi
    fi
}

validate_sudo_access()
{
    USERNAME=$1
    sudo -u "$USERNAME" sudo -l &>dev/null
    if [ $? -eq 0 ]
    then
       echo -e "User $G $USERNAME has sudo access"
    else
      echo -e "User $R $USERNAME has no sudo access try to get sudo access"
    fi
}

read -p "Enter the username to create:"  USERNAME

# Call the function to create the user and give sudo access
create_user "$USERNAME"

# Call the function to validate sudo access
validate_sudo_access "$USERNAME"