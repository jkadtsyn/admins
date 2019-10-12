#! /bin/bash

clear

week=true
while [ $week == true ]

do
echo -e "number day: ";
read number
echo -e "\n";
if (( $number == 1 ))
then
 echo "Monday"

elif (( $number == 2 ))
then
 echo "Tuesday"

elif (( $number == 3 ))
then 
 echo "Wednesday"

elif (( $number == 4 ))
then
 echo "Thursday"

elif (( $number == 5 ))
then
 echo "Friday"

elif (( $number == 6 ))
then
 echo "Saturday"

elif (( $number == 7 ))
then
 echo "Sunday"

else (( $number > 7 ))
echo "Error"

fi

clear

echo -e "Do you want to exit?\ny/n"
read choice
if [[ $choice == "y" ]]
then 
 week=false
 clear
 echo "Bye!"
 sleep 2
fi 
clear
done


