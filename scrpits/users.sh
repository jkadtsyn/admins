#! /bin/bash
GREEN="\033[32m"
RED="\033[31m"
BLUE="\033[34m"
GREY="\033[37m"
END="\033[0m"


function MenuUsers(){
while true;
do

clear
echo -e "$GREEN 1)Show users $END \n"
echo -e "$GREEN 2)Add user $END \n"
echo -e "$GREEN 3)Edit user $END \n"
echo -e "$GREEN 4)Delete user $END \n"
echo -e "$GREEN 5)Exit $END \n"
read x
 case $x in
 1) ShowUser ;;
 2) AddUser ;;
 3) EditUser ;;
 4) DeleteUser ;;
 5) exit 0; ;;
 esac

done
}

function ShowUser(){
while true;
do
 clear
 cat /etc/passwd
 sleep 2;
 
 MenuUsers
done
}

function AddUser(){
while true;
do
clear
 echo -e "$BLUE 1)Name $END \n"
 echo -e "$BLUE 2)Name + uid $END \n"
 echo -e "$BLUE 3)Back $END \n"
read x
 case $x in
  1) echo -e "$BLUE Enter name user $END \n"
     read newname
     useradd $newname ;;
  2) echo -e "$BLUE Enter name user $END \n"
     read newnameu
     echo -e "$BLUE Enter uid user $END \n"
     read newuidn
     useradd $newnameu -u $newuidn ;;
  3) MenuUsers ;;
 esac
done
}


function EditUser(){
while true;
do
clear
 echo -e "$BLUE 1)Edit name $END \n"
 echo -e "$BLUE 2)Edit id $END \n"
 echo -e "$BLUE 3)Edit GropID $END \n"
 echo -e "$BLUE 4)Back $END \n"
read x
 case $x in
 1) echo -e "$BLUE Old name: $END \n"
    read oldname
    echo -e "$BLUE New name: $END \n"
    read newname
    echo -e "`usermod -l $newname $oldname`"
    echo -e "`usermod -d /home/$newname -m $newname`"

    echo -e "`cat /etc/passwd | grep $newname`"
    sleep 1 ;;
 2) echo -e "$BLUE Name $END \n"
    read name
    echo -e "$BLUE newid $END \n"
    read newid
    echo -e "`usermod -u $newid $name`"

    echo -e "`cat /etc/passwd | grep $name`"
    sleep 1 ;;
 3) echo -e "$BLUE Name $END \n"
    read name
    echo -e "$BLUE new GroupID $END \n"
    read newgid
    echo -e "`usermod -g $newgid $name`"

    echo -e "`cat /etc/passwd | grep $name`"
    sleep 1 ;;
 4) MenuUsers;
 esac
done
}

function DeleteUser(){
while true;
do
clear
 echo -e "$BLUE 1)Go Delete $END \n"
 echo -e "$BLUE 2)Back $END \n"
read x
 case $x in
 1) echo -e "$BLUE Enter Name Delete $END \n"
    read deletename
    userdel -rf $deletename ;;
 2) MenuUsers ;;
 esac
done
}
























MenuUsers
