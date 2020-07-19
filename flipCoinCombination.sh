#!/bin/bash -x

# Variable Declaration..

head=1
tail=0

flip=$(( RANDOM % 2 ))

	if [ $flip -eq $head ]
	then
			echo "HEAD WINS"
	elif [ $flip -eq $tail ]
	then
			echo "TAIL WINS"
	else
			exit
	fi
