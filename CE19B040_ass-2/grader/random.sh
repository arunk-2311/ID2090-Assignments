#!/bin/bash


#runs script to create random marks

if test -a marks.csv
then
	#echo "marks removed";
	rm marks.csv;
fi

echo "RollNO,Q1,Q2,Endsem" >>marks.csv

for i in {1..50}
do
	echo $i,$(( ( RANDOM % 25 )  + 1 )),$(( ( RANDOM % 25 )  + 1 )),$(( ( RANDOM % 50 )  + 1 ))>>marks.csv;
done
