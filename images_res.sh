#!/bin/bash 

dos2unix SSB_feed_New.csv

count_image=1
while read line
do
Product_code=`echo $line| awk -F ',' '{print $1'}`

Imageurl=`echo $line | awk -F ',' '{print $2'}`
 wget -t 20 -T 60  -O $count_image.jpg $Imageurl
h_W=`identify -format '%w %h' $count_image.jpg`
final=`echo "$count_image","$h_W"`
count_image=$((count_image+1))
echo $Product_code $final>>Final_new.csv
rm $count_image.jpg
done<SSB_feed_New.csv
