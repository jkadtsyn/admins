#! /bin/bash

clear

#echo -e "What is your name?";
#read name
#echo -e "hello, $name";

echo -e "Enter two numbers:";
read a
read b

if (( a > b ))
then
  echo "$a > $b"

elif (( a < b  ))
then
  echo "$a < $b"

else
echo "$a = $b"

fi


