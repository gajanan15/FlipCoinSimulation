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

function winningPercentage()
{
   echo "Win Combination Percentage"
   for i in ${!coin[@]}
   do
      echo "$i ${coin[$i]}"
   done | sort -k2 -rn | head -1
}

read -p "How many times you want to flip a coin: " noOfFlip
echo "1) One coin"
echo "2) Two coins"
echo "3) Three coins"
read -p "Enter your choice : " choice

case $choice in
	1)
		noOfCoin=1
		flipCoin $noOfFlip $noOfCoin
		calculatePercentage
		winningPercentage
		;;
	2)
		noOfCoin=2
		flipCoin $noOfFlip $noOfCoin
		calculatePercentage
		winningPercentage
		;;
	3)
		noOfCoin=3
		flipCoin $noOfFlip $noOfCoin
		calculatePercentage
		winningPercentage
		;;
	*)
		echo "Invalid Choice"
		;;
esac
