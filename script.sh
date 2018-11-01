#! /bin/bash

RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"

clear
menu1 () {
while true ;
do

clear

echo -e "\t 1.USERNAME\n"
echo -e "\t 2.UPTIME\n"
echo -e "\t 3.TIME\n"
echo -e "\t 4.IP\n"
echo -e "\t next\n"
echo -e "\t exit\n"

read menuone

case $menuone in
	1)
		echo -e "$GREEN USER : $END $RED $USER $END \n"
		sleep 7
		menu1
	;;
	2)
		echo -e "$GREEN uptime: $END $RED `uptime | awk '{print$3}'` $END" 
		sleep 7
		menu1
	;;
	3)
		echo -e "$GREEN TIME : $END $RED `date | awk '{print$4}'` $END\n"
		sleep 7
		menu1
	;;
	4)
		echo -e "$GREEN IP : $END $RED `ifconfig | grep -Eio "inet [0-9|.]+"` $END\n"
		sleep 7
		menu1
	;;
	next)
		menu2
	;;
	exit)
		exit 0
	;;
esac
sleep 5
done
}

menu2 () {
while true ;
do

clear

echo -e "\t 5.DATE\n"
echo -e "\t 6.HOMEDIR\n"
echo -e "\t 7.ACTIVUSERS\n"
echo -e "\t 8.logs\n"
echo -e "\t back \n"
echo -e "\t exit\n"

read menutwo

case $menutwo in
	5)
		echo -e "$GREEN DATE : $END $RED `date +"%Y-%m-%d" ` $END\n"
		sleep 7
		menu2
	;;
	6)
		echo -e "$GREEN HOMEDIR : $END $RED `df -h /home` $END\n\n"
		sleep 7
		menu2
	;;
	7)
		echo -e "$GREEN Activusers : $END $RED `w` $END \n\n"
		sleep 7
		menu2
	;;
	8)
		echo -e "$GREEN LOG 10 MESSAGES : $END $RED `tail -10 /var/log/messages` $END\n\n"
		sleep 7
		menu2
	;;
	back)
		menu1
	;;
	exit)
		exit 0
	;;
esac
done
}
menu1



