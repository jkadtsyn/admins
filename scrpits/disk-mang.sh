#! /bin/bash
RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"


clear
menu(){ 
 echo -e "$GREEN 1) Show all disks \n";
 echo -e " 2) Show disk space \n";
 echo -e " 3) Add new disk \n";
 echo -e " 4) Format \n";
 echo -e " 5) Mount disk \n";
 echo -e " 6) exit $END \n";
 read x
 case $x in
	1)ShowDisk;;
	2)ShowDiskSpace;;
	3)AddDiskNew;;
	4)FormatDisk;;
	5)MountDisk;;
	6)exit 0; ;;

 esac
}

ShowDisk(){
clear
echo -e "`ls -l /dev/sd*` \n $RED ---------- $END"
sleep 1;
menu
}

ShowDiskSpace(){
clear
echo -e "`df -Th` \n $RED ---------- $END"
sleep 1;
menu
}

AddDiskNew(){
clear
echo -e "`ls -l /dev/sd*` \n $RED -------- $END"
sleep 1;
 echo -e "$GREEN Enter disk: $END"
 read Entdisk
 echo -e "\n"
 echo -e "$GREEN 1)Go Add $END \n"
 echo -e "$GREEN 2)No Back $END \n"
read what
 case $what in
 1)fdisk /dev/$Entdisk ;; 
 2)menu; ;;
 esac
}

FormatDisk(){
clear
echo -e "`ls -l /dev/sd*` \n $RED --- $END"
sleep 1
echo -e "`df -Th` \n $RED --------- $END"
sleep 1
echo -e "$GREEN Enter Format disk: $END"
read Formatdisk
 echo -e "\n"
echo -e "$GREEN 1)Go Forman $END \n"
echo -e "$GREEN 2) Back $END \n"
read what
case $what in
 1) echo -e "`mkfs.ext4 /dev/$Formatdisk` \n" ;;
 2) menu ;;
 esac
}

MountDisk(){
clear
echo -e "`ls -l /dev/sd*` \n $RED --- $END"
sleep 1
echo -e "`df -Th` \n $RED --------- $END"
sleep 1
echo -e "$GREEN Enter mount disk: $END"
read mountdisk
echo -e "$GREEN Enter dir: $END"
read enterdir
 echo -e "\n"
echo -e "$GREEN 1)Go Mount $END \n"
echo -e "$GREEN 2) Back $END \n"
read what
case $what in
 1) mount /dev/$mountdisk $enterdir ;;
 2) menu ;;
esac
}











menu
