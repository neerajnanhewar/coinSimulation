#!/bin/bash 

declare -A dictCoinSinglet
# Variable Declaration..

heads=1
tails=0
headwin=0
tailwin=0
function winPercent()
{
	head_win_per=$(( ($headwin*100)/$key ))
	tail_win_per=$(( ($tailwin*100)/$key ))
   echo " HEAD WIN PERCENT " $head_win_per
   echo " TAIL WIN PERCENT " $tail_win_per
}

for (( key=0; key<=5; key++ ))
do
	flip=$(( RANDOM % 2 ))

		if [ $flip -eq $heads ]
		then
				val="HEAD"
				echo "HEAD WINS"
				((headwin++))
		elif [ $flip -eq $tails ]
		then
				val="TAIL"
				echo "TAIL WINS"
				((tailwin++))
		else
				exit
		fi
	 	dictCoinSinglet["$key"]=$val
done
echo "Total Head Wins " $headwin
echo "Total Tail Wins " $tailwin
echo "Total Flips" $key
echo "[" ${dictCoinSinglet[@]} "]"
winPercent
