#!/bin/bash
#create user and give sudo access and validate it using functions
#commands in linux is user add 

R="\e[31m"
G="\e[32m"
N="\e[0m"

create_user() {
    USERNAME=$1
#check the user name and create the user if not available
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
#provide sudo acces to the user
        sudo usermod -aG sudo "$USERNAME"
        if [ $? -eq 0 ]
        then
            echo -e "user $G $USERNAME $N sudo acess granted"
        else
            echo -e "user $R $USERNAME $N sudo acess not granted"
        fi
#create password for the  user
         echo "$USERNAME:$PASSWORD" | sudo chpasswd
         if [ $? -eq 0 ]
         then 
             echo -e "$G $USERNAME password updated sucesfull"
        else
             echo  -e "$R $USERNAME password updation failed"
        exit 1
        fi
    fi
}
#check the sudo acess
validate_sudo_access()
{
    USERNAME=$1
    sudo -u "$USERNAME" sudo -l &>/dev/null
    if [ $? -eq 0 ]
    then
       echo -e "User $G $USERNAME has sudo access"
    else
      echo -e "User $R $USERNAME has no sudo access try to get sudo access"
    fi
}

read -p "Enter the username to create:"  USERNAME
read -sp "Enter the password for '$USERNAME': " PASSWORD  #sp declares that the user can create password securely

# Call the function to create the user and create password and give sudo access
create_user "$USERNAME" "$PASSWORD"

# Call the function to validate sudo access
validate_sudo_access "$USERNAME"