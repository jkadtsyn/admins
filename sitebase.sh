#! /bin/bash

RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"

url="https://app.bitpool.com/#/login?pane=organisation"
curl="`curl $url | grep -i "bpoappversion" | grep -oE "[0-9]+"`"

HM=$[`date +%H` + `date +%M`]

echo -e "$GREEN Time: `date "+%H:%M:%S" `$END"
echo -e "$GREEN Date: `date "+%d:%m:%y" `$END"
echo -e "$RED var = $curl $END"

if (( "$curl"=="$HM" )) ;
then
echo -E "$curl = $HM"
elif (( "$curl">"$HM" )) ;
then
echo -E "$curl > $HM"
elif (( "$curl"<"$HM" )) ;
then
echo -E "$curl < $HM"
else
echo "NO"
fi





























