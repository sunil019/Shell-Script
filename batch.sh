#!/bin/bash


rm -rf batch_id.sql batch_id.csv

exec &>log.z

node="$(date +'%d%m-%H%M%S')"
dir_path=/home/sunil/sunil/Stop_Keyword/stop_script/$node
mkdir $dir_path


File=$1
EMAILID=$2


cp /home/sunil/batch.sql /home/sunil/sunil/Stop_Keyword/stop_script/batch.sql
dos2unix batch.sql
#cat *.csv >> batch.sql
awk -F ',' '{print $1","}' "$File"|uniq>>/home/sunil/sunil/Stop_Keyword/stop_script/batch.sql
aa="00000) group by bub.batch_id ;"
echo $aa >>/home/sunil/sunil/Stop_Keyword/stop_script/batch.sql


java -jar /home/sunil/sunil/Stop_Keyword/stop_script/query_run_sunil.jar batch.sql batch.csv
cp /home/sunil/sunil/Stop_Keyword/stop_script/batch.csv /home/sunil/sunil/Stop_Keyword/stop_script/$node


python batch_mail.py $node $2
python batch_mail.py $node sunil3.kumar@shopclues.com

rm -rf batch_id.sql batch_id.csv 
