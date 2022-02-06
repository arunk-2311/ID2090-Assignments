#!/bin/bash


for l in `ls -1 access*`
do
	awk  '{print substr($4,2,11),$1;}' $l >> log.txt;
done

cat log.txt|sort -u >logs

#cat logs;

awk -f ipd.awk logs|sort > array;

cat array;

rm log.txt;
rm logs;
rm array;



