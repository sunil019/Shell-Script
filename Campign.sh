#!/bin/bash

exec &>log.c

dos2unix producturl.csv

sed -i '1d' producturl.csv


while read line
do
product_id=`echo $line| awk -F ',' '{print $1'}`

Imageurl=`echo $line | awk -F ',' '{print $2'}`
 wget -t 20 -T 60  -O $image.jpg $Imageurl
h_W=`identify -format '%w %h' $image.jpg`
final=`echo "$image","$h_W"`
count_image=$((image+1))
echo $product_id $final>>Final.csv
rm $image.jpg
done<producturl.csv



#sed '1i\'"PID\tImage_Pixcel " Final.csv>Final1.csv



cp /home/sunil/sunil/image.sql /home/sunil/sunil/Stop_Keyword/stop_script/image.sql


dos2unix image.sql

awk -F ',' '{print $1","}' Final.csv|uniq>>/home/sunil/sunil/Stop_Keyword/stop_script/image.sql
aa="00000) group by il.object_id ;"
echo $aa >>/home/sunil/sunil/Stop_Keyword/stop_script/image.sql


java -jar /home/sunil/sunil/Stop_Keyword/stop_script/query_run_sunil.jar image.sql image.csv

sed -i '2d' image.csv

sed -i '1i\' "PID\tTitle\tImage_Count\tDescription " image.csv


#rm -rf image.sql


cp /home/sunil/sunil/feature.sql /home/sunil/sunil/Stop_Keyword/stop_script/feature.sql

dos2unix feature.sql

awk -F ',' '{print $1","}' Final.csv|uniq>>/home/sunil/sunil/Stop_Keyword/stop_script/feature.sql
aa="00000) group by pcc.product_id, cpf.feature_id,cd3.category_id ;"
echo $aa >>/home/sunil/sunil/Stop_Keyword/stop_script/feature.sql

#sed -i 's/ //g' feature.sql


java -jar /home/sunil/sunil/Stop_Keyword/stop_script/query_run_sunil.jar feature.sql feature.csv

sed -i '2d' feature.csv

sed -i '1i\' "CreationTimestamp\tProduct_ID\tProduct_Status\tMercahnt_ID\tMeta_Category\tSub_Category\tLeaf_Cat_ID\tLeaf_Category\tFeature_ID\tFeature_Name\tFeature_Value\tFeatureType  " feature.csv

#rm -rf feature.sql

sed -i '1i\'"PID\tImage_Pixcel " Final.csv


sh Final.sh

awk -F ' ' '{print $2}' Final3.csv>Condition.csv


paste Final.csv Condition.csv>Output_stand.csv

#rm -rf Final.csv Final1.csv Final3.csv Condition.csv ff.csv




