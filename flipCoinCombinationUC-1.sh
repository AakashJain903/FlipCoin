#!/bin/bash

head=1
tail=0

flip=$(( RANDOM % 2 ))

if [[ $flip -eq $head ]]
then
	echo "Head Win"

elif [[ $flip -eq $tail ]]
then
	echo "Tail Win"
else
	exit
fi
