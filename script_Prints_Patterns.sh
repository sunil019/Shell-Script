#!/bin/bash -x
#exec &>log.b 



while read line
do
pid=`echo $line|awk -F ',' '{print $1}'`
rest=`echo $line|awk -F ',' '{print $2}'`

a=`echo $rest|awk -F'[' '{print $2}'|awk -F']' '{print $1}'|grep [0-9A-Za-z]`
#echo $a
if [ "$a" != -v ]
then
IFS='///' read -r -a array <<< "$a"

b=`echo "${array[0]}"`
sed -i "s#$a#$b#g" t3.csv
#sed -i "s#$a#$b#g" t3.csv
echo $b
else
echo "nothing"
#sed -i "s#$a#$b#g" t3.csv
fi
#sed -i -e "s#$a#$b#g" t3.csv

done<t3.csv

rm -rf sed*
