#!/bin/bash -x
declare -A coin

headCount=0
tailCount=0

read -p "How many times you want flip coin: " n
for((i=1;i<=$n;i++))
do
   if [ $((RANDOM%2)) -eq 1 ]
   then
		coin[H]=$((++headCount))
   else
      coin[T]=$((++tailCount))
   fi
done

echo "Key   ${!coin[@]}"
echo "Count ${coin[@]}"

echo "Percentage of head: `echo "scale=2; ${coin[H]}*100/$n" | bc` %"
echo "Percentage of tail: `echo "scale=2; ${coin[T]}*100/$n" | bc` %" 


