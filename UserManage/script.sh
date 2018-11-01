#! /bin/bash

GREEN="\033[32m"
RED="\033[31m"
BLUE="\033[34m"
GREY="\033[37m"
END="\033[0m"

#-------UserManage----------
UserManage(){
while true;
do
clear

echo -e "$GREEN 1)Users $END \n"
echo -e "$GREEN 2)Groups $END \n"
echo -e "$GREEN 3)Show $END \n"
echo -e "$GREEN exit $END \n"
read x

case $x in
1)
Users
;;
2)
Groups
;;
3)
Show
;;
exit)
 exit 0
;;

esac
done
}
#-------Show-----------
function Show(){
while true;
do
clear

echo -e "$GREEN 1)Show [user] $END \n"
echo -e "$GREEN 2)Show [group] $END \n"
echo -e "$GREEN back $END \n"
read x
case $x in
1)
echo -e "`cat /etc/passwd`"
sleep 2
;;
2)
echo -e "`cat /etc/group`"
sleep 2
;;
back)
 UserManage
;;
esac
done
}
#-------Users----------
function Users(){
while true;
do
clear

echo -e "$GREEN 1)Create $END \n"
echo -e "$GREEN 2)Mod $END \n"
echo -e "$GREEN 3)Delete $END \n"
echo -e "$GREEN 4)back $END \n"
read x

case $x in
1)
 CreateUser
;;
2)
 ModUser
;;
3)
 DeleteUser
;;
4)
 UserManage
;;

esac
done
}

function CreateUser(){
while true;
do
clear

echo -e "$BLUE 1)Custom $END \n"
echo -e "$BLUE 2)Default $END \n"
echo -e "$BLUE 3)back $END \n"
read x

case $x in
1)
 CUCustom
;;
2)
 CUDefault
;;
3)
 Users
;;

esac
done
}

function CUCustom(){
clear
echo -e "$BLUE Name - $END"
read name

while true;
do
clear
echo -e "$BLUE UID - $END"
read uid
if grep -iE ":x:$uid:" /etc/passwd > /dev/null ;
then
clear
echo -e "$RED NO $END"
sleep 1
else
break
fi
done

while true;
do
clear
echo -e "$BLUE GID - $END"
read gid
if grep -iE ":[0-9]+:$gid:" /etc/passwd > /etc/null ;
then clear
echo -e "$RED NO $END"
sleep 1
else
break
fi
done

while true;
do
clear
echo -e "$BLUE Expire - $END"
read expire
if echo "$expire" | grep -iE "[0-9]+{4}-[0-9]+{2}-[0-9]+{2}" > /dev/null ;
then
break
else
clear
echo -e "$RED NO $END"
sleep 1
fi
done

clear

echo -e "$BLUE Comment - $END"
read comment

groupadd -g $gid $name
clear

echo -e "$GREEN Create(y) $END \n"
echo -e "$GREEN NO(n) $END \n"

echo -e "$RED -------------- $END \n"

echo "$name:$uid:$gid:$expire:$comment\n"

read Okey


case $Okey in
y)
useradd $name -u $uid -g $gid -e $expire -c $comment
sleep 2
;;
n)
 Users
;;
esac
}

function CUDefault(){
while true;
do
clear

echo -e "$BLUE Name - $END"
read name
echo -e "`useradd $name`"

echo -e "$BLUE 2)back $END \n"
read x
case $x in
2)
 CreateUser
;;
esac
done
}

function ModUser(){
while true;
do
clear


echo -e "$BLUE 1)Next $END \n"
echo -e "$BLUE 2)back $END \n"
read x

case $x in
1)
 MUNext
;;
2)
 Users 
;;
esac
done
}

function MUNext(){
while true;
do
clear

echo -e "$RED back(y/n) - $END"
read What
clear
case $What in
y)
echo -e "$RED Name - $END "
read nameold
clear
echo -e "$BLUE 1)Name $END \n"
echo -e "$BLUE 2)UID $END \n"
echo -e "$BLUE 3)GID $END \n"
echo -e "$BLUE 4)Expire $END \n"
echo -e "$BLUE 5)Comment $END \n"
echo -e "$BLUE 6)back $END \n"
read namedb

case $namedb in
1)
clear
echo -e "$BLUE (New)Name - "
read namenew
echo -e "`usermod $nameold -l $namenew`"
echo -e "`groupmod $nameold -n $namenew`"
;;
2)
clear
echo -e "$BLUE (New)UID - "
read uidnew
echo -e "`usermod $nameold -u $uidnew`"
;;
3)
clear
echo -e "$BLUE (New)GID - "
read gidnew
echo -e "`usermod $nameold -g $gidnew`"
echo -e "`groupmod $nameold -g $gidnew`"
;;
4)
clear
echo -e "$BLUE (New)Expire - "
read expirenew
echo -e "`usermod $nameold -e $expirenew`"
;;
5)
clear
echo -e "$BLUE (New)Comment"
read commentnew
echo -e "`usermod $nameold -c $commentnew`"
;;
6)
 ModUser
;;

esac
;;

n)
 ModUser
;;

esac
done
}

function DeleteUser(){
while true;
do
clear
echo -e "$BLUE Name - $END"
read name
echo -e "`userdel -rf $name`"

echo -e "$BLUE 2)back $END \n"
read x
case $x in
2)
 Users
;;
esac
done
}
#-------Groups----------
function Groups(){
while true;
do
clear


echo -e "$GREEN 1)Create $END \n"
echo -e "$GREEN 2)Mod $END \n"
echo -e "$GREEN 3)Delete $END \n"
echo -e "$GREEN 4)back $END \n"
read x

case $x in
1)
 CreateGroup
;;
2)
 ModGroup
;;
3)
 DeleteGroup
;;
4)
 UserManage
;;
esac
done
}

function CreateGroup(){
while true;
do
clear

echo -e "$BLUE 1)Default $END \n"
echo -e "$BLUE 2)Custom $END \n"
echo -e "$BLUE 3)back $END \n"
read x

case $x in
1)
 CGDefault
;;
2)
 CGCustom
;;
3)
 Groups
;;
esac
done
}

function CGDefault(){
while true;
do
clear

echo -e "$BLUE Group - $END"
read group
echo -e "`groupadd $group`"

echo -e "$BLUE back - $END"
read back
case $back in
y)
 CreateGroup
;;

esac
done
}

function CGCustom(){
while true;
do
clear

echo -e "$BLUE back(y/n) $END \n"
read x
case $x in
y)
clear
 CreateGroup
;;
n)
clear
 echo -e "$RED Name - $END "
 read name
clear
 echo -e "$RED Gid - $END "
 read gid
groupadd $name -g $gid
sleep 2
CGCustom
;;

esac
done
}

function DeleteGroup(){
while true;
do
clear

echo -e "$RED back(y/n) $END \n"
read x
case $x in
y)
clear
 Groups
;;
n)
clear
 echo -e "$RED Name $END"
read name 
 groupdel $name
;;
esac
done
}

function ModGroup(){
while true;
do
clear

echo -e "$BLUE Name - $END"
read name
clear
echo -e "$BLUE 1)Change:Name$END"
echo -e "$BLUE 2)Change:GID$END"
echo -e "$BLUE 3)back $END"
read x
case $x in
1)
clear
echo -e "$RED (NEW)Name - $END"
read NewName
clear
echo -e "`groupmod $name -n $NewName`"
sleep 1
ModGroup
;;
2)
echo -e "$RED (NEW)Gid - $END"
read NewGid
echo -e "`groupmod $name -g $NewGid`"
echo -e "$GREEN GOOD $END"
sleep 1
ModGroup
;;
3)
 Groups
;;
esac
done
}




















UserManage
