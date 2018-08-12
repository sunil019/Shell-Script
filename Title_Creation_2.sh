#!/bin/bash -xvf 

exec &>log.a

node="$(date +'%d%m-%H%M%S')"
dir_path=/home/sunil/sunil/$node
mkdir $dir_path


#exec &>log.a
rm -rf  /home/sunil/sunil/t* /home/sunil/sunil/log.a /home/sunil/sunil/Title_Folder /home/sunil/sunil/Title_Folder.zip
#while read line
    #do
      #echo $line|awk -F';' '{print $1","$12","$9","$13","$11}'  > test1.csv
    #done < $1
 
File=$1
EMAILID=$2

mkdir /home/sunil/sunil/$node/Title_Folder

#grep -i "Brand:S\[\]" New_Title_File.csv>>/home/mobaxterm/Desktop/Auto/Brand_Blank.csv
#grep -v "Brand:S\[\]"New_Title_File.csv>>/home/mobaxterm/Desktop/Auto/Brand_Value.csv

#awk -F ';' '{print $1,$12,$14,$13}' $1>test.csv

awk -F';' '{print $1","$12","$9","$13","$11}' "$File" > test1.csv

dos2unix test1.csv

awk -F',' '{print $1","$2}' test1.csv>t1.csv
awk -F',' '{print $1","$3}' test1.csv>t2.csv
awk -F',' '{print $1","$4}' test1.csv>t3.csv
awk -F',' '{print $1","$5}' test1.csv>t4.csv
awk -F',' '{print $1","$6}' test1.csv>t5.csv

while read line
do
pid=`echo $line|awk -F ',' '{print $1}'`
rest=`echo $line|awk -F ',' '{print $2}'`
count=`echo $line|awk -F '///' '{print NF}'`
echo $count
if [ $count -gt 2 ] 
then
echo $rest
a=`echo $rest|awk -F'[' '{print $2}'|awk -F']' '{print $1}'`
sed -i  "s#$a#Multi#" t2.csv
echo $a
fi
done<t2.csv

while read line
do
pid=`echo $line|awk -F ',' '{print $1}'`
rest=`echo $line|awk -F ',' '{print $2}'`
count=`echo $line|awk -F '///' '{print NF}'`
if [ $count -eq 2 ]
then
sed -i 's#///# \& #g' t2.csv
echo "one color"
fi
done<t2.csv

sh script_Prints_Patterns.sh
sh script_fabric.sh

sh new_script_Prints_Patterns.sh
sh new_script_fabric.sh



while read line
do
pid=`echo $line|awk -F ',' '{print $1}'`
rest=`echo $line|awk -F ',' '{print $2}'`

a=`awk -F ',' '{print $2}' $rest | cut -f2 -d'[' | cut -f1 -d ']'`
de
sed -i "s/With Blouse/Sarre With Blouse/g" t5.csv
sed -i "s/Without Blouse/Sarre Without Blouse/g" t5.csv
done<t5.csv




#while read line
#do
#pid=`echo $line|awk -F ',' '{print $1}'`
#rest=`echo $line|awk -F ',' '{print $2}'`

#a=`echo $rest|awk -F'[' '{print $2}'|awk -F']' '{print $1}'|grep [0-9A-Za-z]`
#echo $a
#if [ "$a" != ""]
#then
#IFS='///' read -r -a array <<< "$a"

#b=`echo "${array[0]}"`
#sed -i "s#$a#$b#g" t3.csv
#echo $b
#else
#echo "nothing"
#sed -i "s#$a#$b#g" t3.csv
#fi
#sed -i -e "s#$a#$b#g" t3.csv

#done<t3.csv


#while read line
#do
#pid=`echo $line|awk -F ',' '{print $1}'`
#rest=`echo $line|awk -F ',' '{print $2}'`

#a=`echo $rest|awk -F'[' '{print $2}'|awk -F']' '{print $1}'| grep [0-9A-Za-z]`
#if [ "$a" != "" ]
#then
#echo $a
#IFS='///' read -r -a array <<< "$a"

#b=`echo "${array[0]}"`
#sed -i "s#$a#$b#g" t4.csv
#sed -i  "s#$a#$b#g" t4.csv
#echo $b
#else
#echo "nothing"
#sed -i "s#$a#$b#g" t4.csv
#fi
#sed -i "s#$a#$b#g" t4.csv
#done<t4.csv


#echo "$(awk -F',' '{print $1","$2}' t1.csv)" "$(awk -F',' '{print $2"}' t2.csv)" "$(awk -F',' '{print $2"}' t3.csv)" "$(awk -F',' '{print $2"}' t4.csv)"

 
paste t1.csv t2.csv t3.csv t4.csv t5.csv|sed 's/\t/,/g'|awk -F',' '{print $1","$2","$4","$6,","$8","$10}'>test1.csv

#grep -i "Brand:S\[\]" test1.csv>>/home/sunil/sunil/Title_Folder/Brand_Blank.csv
#grep -v "Brand:S\[\]" test1.csv>>/home/sunil/sunil/Title_Folder/Brand_Value.csv

grep -i "Brand:S\[\]" test1.csv>>/home/sunil/sunil/$node/Brand_Blank.csv
grep -v "Brand:S\[\]" test1.csv>>/home/sunil/sunil/$node/Brand_Value.csv


#rm -rf test.csv

#awk -F ';' '{print $1,$12,$14,$13}' $1>test.csv

while read line
do
echo "$(echo $line|awk -F',' '{print $1}')""|""$(echo $line | tr ':' '\n' | grep "\[" | cut -f2 -d'[' | cut -f1 -d ']' | tr '\n' ' ')" >> /home/sunil/sunil/$node/Title_Folder/Title_Brand_Include.csv

#echo -e "\n" >> temp.csv
#sed  -i 's/NA//g' temp.csv
#sed -i.bak 's/$/ -sarre/' temp.csv

done</home/sunil/sunil/$node/Brand_Value.csv


sed -i 's/NA//g' /home/sunil/sunil/$node/Title_Folder/Title_Brand_Include.csv
sed -i 's/[[:blank:]]*$//' /home/sunil/sunil/$node/Title_Folder/Title_Brand_Include.csv
#sed -i 's/$/ Saree/g' /home/sunil/sunil/Title_Folder/Title_Brand_Include.csv
sed -i '1d' /home/sunil/sunil/$node/Title_Folder/Title_Brand_Include.csv
sed -i '1i\'"Product-Id |Title" /home/sunil/sunil/$node/Title_Folder/Title_Brand_Include.csv


while read line
do
echo "$(echo $line|awk -F',' '{print $1}')""|""$(echo $line | tr ':' '\n' | grep "\[" | cut -f2 -d'[' | cut -f1 -d ']' | tr '\n' ' ')" >> /home/sunil/sunil/$node/Title_Folder/Title_N_Include_Brand.csv

#echo -e "\n" >> temp.csv
#sed  -i 's/NA//g' temp.csv
#sed -i 's/$/sarre/' temp.csv

done</home/sunil/sunil/$node/Brand_Blank.csv


sed -i 's/NA//g' /home/sunil/sunil/$node/Title_Folder/Title_N_Include_Brand.csv
sed -i 's/[[:blank:]]*$//' /home/sunil/sunil/$node/Title_Folder/Title_N_Include_Brand.csv
#sed -i 's/$/ Saree/g' /home/sunil/sunil/Title_Folder/Title_N_Include_Brand.csv
sed -i '1d' /home/sunil/sunil/$node/Title_Folder/Title_N_Include_Brand.csv
sed -i '1i\'"Product-Id\t |Title\t" /home/sunil/sunil/$node/Title_Folder/Title_N_Include_Brand.csv

zip -r /home/sunil/sunil/$node/Title_Folder.zip /home/sunil/sunil/$node/Title_Folder

#cd Title_Folder


#rm -f /home/sunil/sunil/sed* /home/sunil/sunil/t* 
#rm -rf t1.csv t2.csv t3.csv t4.csv test1.csv 


#echo ("Title has been Generated with PID")

#while read line
#do
#awk -F '///' '{print NF}' temp.csv
#if
#done<temp.csv

python mail.py $node $2
python mail.py $node sunil3.kumar@shopclues.com

rm -rf File /home/sunil/sunil/$node/Brand_Blank.csv /home/sunil/sunil/Brand_Value.csv
