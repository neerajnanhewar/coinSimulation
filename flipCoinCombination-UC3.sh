#!/bin/bash 

declare -A dictCoinDublet
# Variable Declaration..

heads=1
tails=0
headwin=0
headwin2=0
tailwin=0
tailwin2=0
function winPercent()
{
	head_head_win_per=$(( ($headwin*100)/$key ))
	tail_tail_win_per=$(( ($tailwin*100)/$key ))
   echo " HH WIN PERCENT " $head_head_win_per
   echo " TT WIN PERCENT " $tail_tail_win_per
 	head_tail_win_per=$(( ($headtailwin*100)/$key ))
   tail_head_win_per=$(( ($tailheadwin*100)/$key ))
	echo " HT WIN PERCENT " $head_tail_win_per
	echo " TH WIN PERCENT " $tail_head_win_per
}

for (( key=0; key<=5; key++ ))
do
		flip1=$(( RANDOM % 2 ))
	 	flip2=$(( RANDOM % 2 ))

		if [ $flip1 -eq $heads ] && [ $flip2 -eq $heads ]
		then
				val="H"
				val2="H"
				echo "HEAD HEAD WINS"
				((headwin++))
		elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $tails ]

		then
				val="T"
				val2="T"
				echo "TAIL TAIL WINS"
				((tailwin++))
		elif [ $flip1 -eq $heads ] &&  [ $flip2 -eq $tails ]
      then
            val="H"
            val2="T"
            echo "HEAD TAIL WINS"
            ((headtailwin++))
		elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $heads ]
      then
            val="T"
            val2="H"
            echo "TAIL HEAD WINS"
            ((tailheadwin++))
		else
				exit
		fi
 

 			dictCoinDoublet["$key"]=$val$val2
done
echo "Total Head Wins " $headwin
echo "Total Tail Wins " $tailwin
echo "Total Flips" $key
echo "[" ${dictCoinDoublet[@]} "]"
winPercent
