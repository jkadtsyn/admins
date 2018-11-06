#! /bin/bash

RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"

function site(){
url="https://postcode.in.ua/ua/codes/city/1007/a"
curl $url > index1234.html
for i in index1234.html ;
do
if grep -iE "https://postcode.in.ua/ua/codes/city/1007/street/[0-9]+" index1234.html > /dev/null;
then
grep -ioE "https://postcode.in.ua/ua/codes/city/1007/street/[0-9]+" index1234.html > /root/pngl
else
continue
fi
done
pngl="`cat /root/pngl`"
for i in $pngl ;
do
wget -P /root/admins/pngsite/ $i
cd /root/admins/pngsite/
done
npng="`ls /root/admins/pngsite/`"
count=0
p=".png"
for i in $npng ;
do
count=$((count+1))
mv /root/admins/pngsite/"Img$count$p"
done
}
site
