#!/bin/bash 

#declare dictionary
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
				((headwin++))
		elif [ $flip -eq $tails ]
		then
				val="TAIL"
				((tailwin++))
		else
				exit
		fi
	 	dictCoinSinglet["$key"]=$val
done 
	head_win_per=`awk "BEGIN { print $(($headwin*100)) / $key }"`
	tail_win_per=`awk "BEGIN { print $(($tailwin*100)) / $key }"`
   	echo " HEAD WIN PERCENT " $head_win_per
   	echo " TAIL WIN PERCENT " $tail_win_per
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
				((headwin++))
		elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $tails ]

		then
				val="T"
				val2="T"
				((tailwin++))
		elif [ $flip1 -eq $heads ] &&  [ $flip2 -eq $tails ]
      then
            val="H"
            val2="T"
            ((headtailwin++))
		elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $heads ]
      then
            val="T"
            val2="H"
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
				((headwin++))
		elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $tails ] && [ $flip3 -eq $tails ] 
		then
				val="T"
				val2="T"
				val3="T"
				((tailwin++))
		elif [ $flip1 -eq $heads ] &&  [ $flip2 -eq $tails ] && [ $flip3 -eq $tails ] 
      then
            val="H"
            val2="T"
			val3="T"
            ((headtailtail++))
		elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $heads ] && [ $flip3 -eq $heads ] 
      then
            val="T"
            val2="H"
				val3="H"
            ((tailheadhead++))
			elif [ $flip1 -eq $heads ] && [ $flip2 -eq $heads ] && [ $flip3 -eq $tails ]
      then
            val="H"
            val2="H"
            val3="T"
            ((headheadtail++))
      elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $tails ] && [ $flip3 -eq $heads ]

      then
            val="T"
            val2="T"
            val3="H"
            ((tailtailhead++))
      elif [ $flip1 -eq $heads ] &&  [ $flip2 -eq $tails ] && [ $flip3 -eq $heads ]
      then
            val="H"
            val2="T"
            val3="H"
            ((headtailhead++))
      elif [ $flip1 -eq $tails ] &&  [ $flip2 -eq $heads ] && [ $flip3 -eq $tails ]
      then
            val="T"
            val2="H"
            val3="T"
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
}

function sorting_Combination
{
winPercent1 | sort -n -k4
winPercent2 | sort -n -k4
winPercent3 | sort -n -k4
}

sorting_Combination | sort -n -k4





