#!/bin/bash 
declare -A dictCoin

heads=1
tails=0

function winHead() {
	percent=$((($headwin*100)/$i))
	echo "Head Win Percent is : " $percent
}

function winTail() {
	percent=$((($tailwin*100)/$i))
	echo "Tail Win Percent is : " $percent
}

for (( i=0; i<=5; i++ )) do
	flip=$(( RANDOM % 2 ))
	if [[ $flip -eq $heads ]]
	then
		val="HEADS"
		echo "Head Win"
		((headwin++))

	elif [[ $flip -eq $tails ]]
	then
		val="TAILS"
		echo "Tail Win"
		((tailwin++))
	else
		exit
	fi

	dictCoin["$i"]=$val
	
done
echo "Flipping Coin Store the Singlet Combination......."

echo ${!dictCoin[@]}
echo ${dictCoin[@]}

winHead
winTail
