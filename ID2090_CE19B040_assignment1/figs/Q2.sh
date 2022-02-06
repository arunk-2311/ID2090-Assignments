#!/bin/bash

for n in `ls -1`
do
	if test -d $n
	then
		for d in `ls -1 $n` 
		do
			if test -d $n/$d
			then
				for f in `ls -1 $n/$d`
				do
					name=${f:0:-4};
					ext=$(file $n/$d/$f|awk -f x.awk);
					newname=$name$ext;
					mv $n/$d/$f $n/$d/$newname;
				done
			fi

		done
	fi
done
