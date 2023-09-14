#!/bin/bash
clear

echo -e "Today's date is \c"; date
echo -e "\nThe people logged into the system include:"; who
echo -e "\nWould you like to see the contents of you home directory?(y/n) >\c"
read answer
if [ $answer = 'y' -o $answer = 'yes' ]; then
    echo -e "\nThe contents of your home directory are:"; ls
fi