#! /bin/bash
#^
url="https://postcode.in.ua/ua/codes/city/1007/a"

curl $url | grep -i "text_tab_1"| grep -oE "https://postcode.in.ua/ua/codes/city/1007/street/[0-9]+" > adresses

while read line
do
curl $line | grep -oE "https://postcode.in.ua/images/image_c.php\?id=[0-9]+" >> adressespng
done < adresses

while read line
do
wget -P /root/admins/pngsite/ "$line"
done < adressespng

count=0
p=.png
png="`ls /root/admins/pngsite`"
for line in $png;
do
count=$((count+1))

mv /root/admins/pngsite/"$line" pngsite/"IMG$count$p"
done















































