#!/bin/bash

number=$(($RANDOM % 100 + 1))
echo "guess a number between 1 and 100"
guess=0
count=0
while [ $guess -ne $number ]; do
    read guess
    ((count=count+1))
    if [ $guess -lt $number ]; then
        echo "Your guess is too low"
    elif [ $guess -gt $number ]; then
        echo "Your guess is too high"
    fi
done
echo -e "You completes the guessing game in $count\nGreat guess"
exit 0