#!/bin/bash 

declare -A dictCoinDoublet

heads=1
tails=0

function winHead() {
	percent=$((($headwin*100)/$i))
	echo "HH Win Percent is : " $percent
}

function winTail() {
	percent=$((($tailwin*100)/$i))
	echo "TT Win Percent is : " $percent
}

function winHeadTail() {
        percent=$((($headtailwin*100)/$i))
        echo "HT Win Percent is : " $percent
}

function winTailHead() {
        percent=$(( ($tailheadwin*100) / $i ))
        echo "TH Win Percent is : " $percent
}

for (( i=0; i<=5; i++ )) 
do
	flip=$(( RANDOM % 2 ))
	flip1=$(( RANDOM % 2 ))
	if [[ $flip -eq $heads && $flip1 -eq $heads ]]
	then
		val="H"
		val1="H"
		echo "Head Win"
		((headwin++))

	elif [[ $flip -eq $tails && $flip -eq $tails ]]
	then
		val="T"
		val1="T"
		echo "Tail Win"
		((tailwin++))

	elif [[ $flip -eq $heads && $flip1 -eq $tails ]]
        then
                val="H"
                val1="T"
                echo "Head Win"
                ((headtailwin++))

        elif [[ $flip -eq $tails && $flip1 -eq $heads ]]
        then
                val="T"
                val1="H"
                echo "Tail Win"
                ((tailheadwin++))
	else
		exit
	fi


        dictCoinDoublet["$i"]=$val$val1


done

echo "Flipping Coin Store the doublet Combination......."
echo ${!dictCoinDoublet[@]}
echo ${dictCoinDoublet[@]}

winHead
winTail
winHeadTail
winTailHead
