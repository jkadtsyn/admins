#! /bin/bash

exit=true
while [[ $exit == true ]]
do


echo -e "Enter month number:"
read month
echo "exit (0)";

case $month in
 1|2|12) echo "Winter"; ;;
 3|4|5) echo "Besna"; ;;
 6|7|8) echo "Osin"; ;;
 9|10|11) echo "lito"; ;;
 0) exit=false; ;;
 *) echo "Wrong month number."; ;;
esac


done













