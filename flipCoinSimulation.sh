#!/bin/bash

echo "Welcome to Flip coin Simulation"

declare -A coin

function flipCoin()
{
   for((i=1;i<=$1;i++))
   do
      side=""
      for((j=1;j<=$2;j++))
      do
         if [ $((RANDOM%2)) -eq 1 ]
         then
            side+=H
         else
            side+=T
         fi
      done
      updateCount $side
   done
}

function updateCount()
{
   coin[$1]=$((${coin[$1]}+1))
}

function calculatePercentage()
{
	for i in ${!coin[@]}
	do
		coin[$i]=`echo "scale=2; ${coin[$i]}*100/$noOfFlip" | bc`
	done
	echo "Key        ${!coin[@]}"
	echo "Percentage ${coin[@]}"
}
read -p "How many times you want to flip a coin: " noOfFlip
echo "1) Single coin"
echo "2) Double coins"
echo "3) Three coins"
read -p "Enter your choice : " choice
case $choice in
   1)
      noOfCoin=1
      ;;
   2)
      noOfCoin=2
      ;;
	3)
		noOfCoin=3
		;;
   *)
      echo "Invalid Choice"
      ;;
esac

flipCoin $noOfFlip $noOfCoin
calculatePercentage
