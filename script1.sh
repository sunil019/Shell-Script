#!/bin/bash -xvf 

rm -rf stop_keyword_data.csv Fashion.csv Wired.csv Automotive.csv HnK.csv
exec &>log.a
#dos2unix File
#rm -rf stop_keyword_data.csv Fashion.csv Wired.csv Automotive.csv HnK.csv 

node="$(date +'%d%m-%H%M%S')"
dir_path=/home/sunil/sunil/Stop_Keyword/stop_script/$node
mkdir $dir_path

#dos2unix stop_keyword_file.csv

#echo "Please enter the Usernameu"
#read a
#echo "Please enter the password"
#read b
#b=$2
File=$1
#cp /home/sunil/sunil/Stop_Keyword/stop_script/$1 home/sunil/sunil/Stop_Keyword/stop_script/$node
#rm -rf /home/sunil/sunil/Stop_Keyword/stop_script/$1
echo $File

EMAILID=$2
echo $EMAILID

Cluster=$3
echo $Cluster

dos2unix $1
#File=$2
#$2 /home/sunil/sunil/Stop_Keyword/stop_script/stop_keyword_file.csv
#mv $2 /home/sunil/sunil/Stop_Keyword/stop_script/stop_keyword_file.csv 
if [ "$Cluster" == "Fashion" ]
then 
java -jar /home/sunil/sunil/Stop_Keyword/stop_script/query_run_sunil.jar Fashion.sql Fashion.csv

cp /home/sunil/sunil/Stop_Keyword/stop_script/Fashion.csv /home/sunil/sunil/Stop_Keyword/stop_script/$node
#sed 's/^/,/g' fashion.csv > data1.csv
while read line 
do 
echo $line 
grep -w "$line" /home/sunil/sunil/Stop_Keyword/stop_script/$node/Fashion.csv|sed "s/^/$line\t/g" >>/home/sunil/sunil/Stop_Keyword/stop_script/$node/stop_keyword_data.csv
done<$File
sed -i '1i\'"Stop_word\tPID\tTitle\tStatus\tMID\tLink_Type\tCat_ID\tCat_Path " /home/sunil/sunil/Stop_Keyword/stop_script/$node/stop_keyword_data.csv

elif [ "$Cluster" == "Wired" ]
then 
java -jar /home/sunil/sunil/Stop_Keyword/stop_script/query_run_sunil.jar Wired.sql Wired.csv

cp /home/sunil/sunil/Stop_Keyword/stop_script/Wired.csv /home/sunil/sunil/Stop_Keyword/stop_script/$node

#sed 's/^/,/g' wired.csv > data1.csv

while read line
do
echo $line
grep -w "$line" /home/sunil/sunil/Stop_Keyword/stop_script/$node/Wired.csv|sed "s/^/$line\t/g" >>/home/sunil/sunil/Stop_Keyword/stop_script/$node/stop_keyword_data.csv
done<$File
sed -i '1i\'"Stop_word\tPID\tTitle\tStatus\tMID\tLink_Type\tCat_ID\tCat_Path " /home/sunil/sunil/Stop_Keyword/stop_script/$node/stop_keyword_data.csv

elif [ "$Cluster" == "HnK" ]

then 

java -jar /home/sunil/sunil/Stop_Keyword/stop_script/query_run_sunil.jar HnK.sql HnK.csv

cp /home/sunil/sunil/Stop_Keyword/stop_script/HnK.csv /home/sunil/sunil/Stop_Keyword/stop_script/$node

#sed 's/^/,/g' hk.csv > data1.csv

while read line
do
#a=`echo $line`
echo $line
grep -w "$line" /home/sunil/sunil/Stop_Keyword/stop_script/$node/HnK.csv|sed "s/^/$line\t/g">>/home/sunil/sunil/Stop_Keyword/stop_script/$node/stop_keyword_data.csv
done<$File
sed -i '1i\'"Stop_word\tPID\tTitle\tStatus\tMID\tLink_Type\tCat_ID\tCat_Path " /home/sunil/sunil/Stop_Keyword/stop_script/$node/stop_keyword_data.csv

#elif [ "$Cluster" == "GM" ]

#then

#java -jar /home/sunil/sunil/Stop_Keyword/stop_script/query_run_sunil.jar Automotive.sql Automotive.csv

#cp /home/sunil/sunil/Stop_Keyword/stop_script/Automotive.csv /home/sunil/sunil/Stop_Keyword/stop_script/$node
   #sed -i 's/^/,/g' automotive.csv

#while read  line
#do
#echo $line
#grep -w "$line" /home/sunil/sunil/Stop_Keyword/stop_script/$node/Automotive.csv|sed "s/^/$line\t/g">>/home/sunil/sunil/Stop_Keyword/stop_script/$node/stop_keyword_data.csv
#done<$File
#sed -i '1i\'"Stop_word\tPID\tTitle\tStatus\tMID\tLink_Type\tCat_ID\tCat_Path " /home/sunil/sunil/Stop_Keyword/stop_script/$node/stop_keyword_data.csv

else 

echo "please select correct cluster "

fi



#rm -rf  File
python mail_test.py $node $2
python mail_test.py $node sunil3.kumar@shopclues.com



#rm -rf File
