#!/bin/bash 

declare -A dictCoinSinglet
declare -A dictCoinDublet
declare -A dictCoinTriplet
#Variable Declaration..

heads=1
tails=0
headwin=0
tailwin=0
function winPercent1()
{
for (( key=0; key<=5; key++ ))
do
	flip=$(( RANDOM % 2 ))

		if [ $flip -eq $heads ]
		then
				val="HEAD"
			#	echo "HEAD WINS"
				((headwin++))
		elif [ $flip -eq $tails ]
		then
				val="TAIL"
			#	echo "TAIL WINS"
				((tailwin++))
		else
				exit
		fi
	 	dictCoinSinglet["$key"]=$val
done | 
	head_win_per=$(( ($headwin*100)/$key ))
	tail_win_per=$(( ($tailwin*100)/$key ))
   	echo " HEAD WIN PERCENT " $head_win_per
   	echo " TAIL WIN PERCENT " $tail_win_per
	echo "Total Head Wins " $headwin
	echo "Total Tail Wins " $tailwin
	echo "Total Flips" $key
#	echo "[" ${dictCoinSinglet[@]} "]"
}


function winPercent2()
{
for (( key=0; key<=50; key++ ))
do
		flip1=$(( RANDOM % 2 ))
	 	flip2=$(( RANDOM % 2 ))

		if [ $flip1 -eq $heads ] && [ $flip2 -eq $heads ]
		then
				val="H"
				val2="H"
			#	echo "HEAD HEAD WINS"
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
          #  echo "HEAD TAIL WINS"
            ((headtailwin++))
		elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $heads ]
      then
            val="T"
            val2="H"
         #   echo "TAIL HEAD WINS"
            ((tailheadwin++))
		else
				exit
		fi
 			dictCoinDoublet["$key"]=$val$val2
done

	head_head_win_per=`awk "BEGIN {print $(($headwin*100))/$key}"`
	tail_tail_win_per=`awk "BEGIN {print $(($tailwin*100))/$key}"`
    echo " HH WIN PERCENT " $head_head_win_per
    echo " TT WIN PERCENT " $tail_tail_win_per
 	head_tail_win_per=`awk "BEGIN {print $(($headtailwin*100))/$key}"`
    tail_head_win_per=`awk "BEGIN {print $(($tailheadwin*100))/$key}"`
	echo " HT WIN PERCENT " $head_tail_win_per
	echo " TH WIN PERCENT " $tail_head_win_per
	echo "Total Head Wins " $headwin
	echo "Total Tail Wins " $tailwin
	echo "Total Flips" $key
#	echo "[" ${dictCoinDoublet[@]} "]"
}

function winPercent3()
{

for (( key=0; key<50; key++ ))
do
		flip1=$(( RANDOM % 2 ))
	 	flip2=$(( RANDOM % 2 ))
		flip3=$(( RANDOM % 2 ))
		if [ $flip1 -eq $heads ] && [ $flip2 -eq $heads ] && [ $flip3 -eq $heads ]
		then
				val="H"
				val2="H"
				val3="H"
		#		echo "HEAD HEAD HEAD WINS"
				((headwin++))
		elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $tails ] && [ $flip3 -eq $tails ] 

		then
				val="T"
				val2="T"
				val3="T"
		#		echo "TAIL TAIL TAIL WINS"
				((tailwin++))
		elif [ $flip1 -eq $heads ] &&  [ $flip2 -eq $tails ] && [ $flip3 -eq $tails ] 
      then
            val="H"
            val2="T"
			val3="T"
        #    echo "HEAD TAIL TAIL WINS"
            ((headtailtail++))
		elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $heads ] && [ $flip3 -eq $heads ] 
      then
            val="T"
            val2="H"
				val3="H"
        #    echo "TAIL HEAD HEAD WINS"
            ((tailheadhead++))
		


			elif [ $flip1 -eq $heads ] && [ $flip2 -eq $heads ] && [ $flip3 -eq $tails ]
      then
            val="H"
            val2="H"
            val3="T"
            #echo "HEAD HEAD TAIL WINS"
            ((headheadtail++))
      elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $tails ] && [ $flip3 -eq $heads ]

      then
            val="T"
            val2="T"
            val3="H"
           # echo "TAIL TAIL HEAD WINS"
            ((tailtailhead++))
      elif [ $flip1 -eq $heads ] &&  [ $flip2 -eq $tails ] && [ $flip3 -eq $heads ]
      then
            val="H"
            val2="T"
            val3="H"
            #echo "HEAD TAIL HEAD WINS"
            ((headtailhead++))
      elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $heads ] && [ $flip3 -eq $tails ]
      then
            val="T"
            val2="H"
            val3="T"
           # echo "TAIL HEAD TAIL WINS"
            ((tailheadtail++))

else
				exit
		fi
 			dictCoinTriplet["$key"]=$val$val2$val3
done

	head_head_win_per=`awk "BEGIN { print $(($headwin*100)) / $key }"`
	tail_tail_win_per=`awk "BEGIN { print $(($tailwin*100)) / $key }"`
    echo " HHH WIN PERCENT " $head_head_win_per
    echo " TTT WIN PERCENT " $tail_tail_win_per
 	head_tail_tail_win_per=`awk "BEGIN { print $(($headtailtail*100 )) / $key }"`
    tail_head_head_win_per=`awk "BEGIN { print $(($tailheadhead*100 )) / $key }"`
	echo " HTT WIN PERCENT " $head_tail_tail_win_per
	echo " THH WIN PERCENT " $tail_head_head_win_per
	head_head_tail_win_per=`awk "BEGIN { print $(($headheadtail*100 )) / $key }"`
    tail_tail_head_win_per=`awk "BEGIN { print $(($tailtailhead*100 )) / $key }"`
    echo " HHT WIN PERCENT " $head_head_tail_win_per
    echo " TTH WIN PERCENT " $tail_tail_head_win_per
 	head_tail_head_win_per=`awk "BEGIN { print $(($headtailhead*100 )) / $key }"`
    tail_head_tail_win_per=`awk "BEGIN { print $(($tailheadtail*100 )) / $key }"`
    echo " HTH WIN PERCENT " $head_tail_head_win_per
    echo " THT WIN PERCENT " $tail_head_tail_win_per
	echo "Total Head Wins " $headwin
	echo "Total Tail Wins " $tailwin
	echo "Total Flips" $key
#	echo "[" ${dictCoinTriplet[@]} "]"
}
winPercent1
winPercent2
winPercent3






