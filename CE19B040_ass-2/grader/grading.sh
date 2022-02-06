#!/bin/bash

#run this script after random.sh or when you have marks.csv file available already

maxx=`awk 'BEGIN{FS=",";max=0;}{if($2+$3+$4 > max){max=$2+$3+$4;}}END{print max;}' marks.csv`;

#echo $maxx;

cat marks.csv|awk -f norm.awk -v max=$maxx;
