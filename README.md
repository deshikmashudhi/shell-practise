# shell-practise
#!/bin/bash  ---> shebang 
statement you should inform linux server how to execute the script if you dont give it will not work it is used how to compile and how to execute

echo "hello world im learing"  --> it is used to print some thing
bash = shell
sh script name
bash and shell both are same
variable
data types
conditions
loops
functions

variables:
dry run: dont repeat yourself when ever there is a duplicate try to avoid it 
1.declaring inside the script
2.how to execute a command inside shell script and take the output
3.always get the values of variable form command line

when i want to connect for some db related software i need to enter passwword if i give in script it is exposed and if i give md it is also exposed so it takes the input from terminal

datatypes
int i=0
float a=2.0
boolean  true
string "deshik"
dont worry about data types shell script can intelligently understand about datatypes
number is a general data type
boolean 0 or 1 0 =failure 1 = success
array  it can hold multiple values


task:
ssh authentication
execting folder how you intialzie and push to github
start shell scripting

if(experssion)
# is true these lines will learn)
}
else{
if above expression false then it will run
}

algorthm 
install git
you should be root otherwise it will fail
if []
then
  these commands will run if expression is true
else
   these commands will run if expression is false
fi
less lines of code but more work princpile dryrun
functions you will keep some code inside 
fucntions which is more often repeeated and call when ever required 
function will do some work on behalf of us and it will update what happen
FUNCTION_NAME(){
    here writte your statements and call this function whwnever required
}

#our program goal is to install mysql
# check root user or not if not root exit the program and say to user to run with sudo access if root user install mysql
#user id -->0 is always for root user
#non root id --> 1not 0
#it is our responsible to check again installation porcoess is correct or not
yum install mysql -y
#shell script by default will not stop if it faces error it is our responsibulity to check for the errors
# there is exit status
#$? it will store the previous command status
# $?--> 0 then previous command is succes
# $? --> 1-127 then it is failuree
#this is validation sucess or failure
#functions you will keep some code inside fucntions which is more often repeeated and call wheenver required 
log files are important what happen 
scripting guy responsible to keep log files for checking what happen always keep log files
redirections --> used for keeping log files

> --> it will only redirect success output
1 --> successs
2 --> failure
& --> success or failure both need to store
lsss -l &>ls.log
cat ls.log --> it will store the data
> --> it willremove the previous content and ads new content
>> it will append the log data


ls -l &>>ls.log

date +%F:%H:%M:%S it will show in correcct format and date hours millimeter seconds year

to run multiple packages to install use loops

while preparing shell script prepare mind set it fallows same concept 
variable
datatypes
conditions
loops
functions
any scripting or programming we use these only ansible python scripting
persisit the log files --> output redirection 
color is user ecperience
validations --> we need to check the exit status based on status code we can take decisisions

algorithm things to do
install mmultiple script to install packages
user will pass the packaeges thorugh command line
user should have root acces
while installing store logs
before installing it is always to check whehter package is already installed or not 
if skip otherwise proceed for installtion
check successfully installed or not
implement some colours.

sh script name no nedd of execution permission
./ script name it should have execution permission

#schedule this file everyday like crontab
* * * * /home/centos/shell-practice/deletelogs.sh