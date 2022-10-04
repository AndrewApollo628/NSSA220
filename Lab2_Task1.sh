#!/bin/bash 
num_rands=$1
min=$2
max=$3
num_generated=0
total=0
rm rands_$num_rands.txt

num_writer() {
   echo $num_generated >> rands_$num_rands.txt
}

if [ $# -eq 1 ]
then 
 for ((i=0; i<$num_rands; i++))
   do
     num_generated=$RANDOM
     total=$(($total + $num_generated)) 
     num_writer
   done

   sort -n rands_$num_rands.txt > rands_$num_rands_sorted.txt   
   smallest=$(head -n 1 rands_$num_rands_sorted.txt)
   largest=$(tail -n 1 rands_$num_rands_sorted.txt)
   average=$(($total / $num_rands))
   echo "You requested to print $num_rands random integers"
   echo "The smallest number is: $smallest" 
   echo "The largest number is: $largest"
   echo "The average is: $average"

elif [ $# -eq 3 ] 
  then
   for((i=0; i<$num_rands; i++))
     do
    num_generated=$(shuf -i $min-$max -n 1)
    total=$(($total + $num_generated)) 
    num_writer	
    done

    sort -n rands_$num_rands.txt > rands_$num_rands_sorted.txt   
    smallest=$(head -n 1 rands_$num_rands_sorted.txt)
    largest=$(tail -n 1 rands_$num_rands_sorted.txt)	
    average=$(($total / $num_rands))
    echo "You requested to print $num_rands random integers between $min and $max"
    echo "The smallest number is: $smallest" 
    echo "The largest number is: $largest"
    echo "The average is: $average"

else
    echo "incorrect format you have $# arguments when you need atleast 1"
fi

