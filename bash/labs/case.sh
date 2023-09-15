#!/bin/bash
clear

echo -e "What would you like to see?\nToday's Date (d)\nCurrently logged in users (u)\nThe content of your home directory (r)\n>>\c"
read promt
if [ $promt = 'd' -o $promt = 'D' ] ; then
    echo -e "Today's date is \c"; date
elif [ $promt = 'u' -o $promt = 'U' ]; then
    echo -e "\nThe people logged into the system include:"; who
elif [ $promt = 'r' -o $promt = 'R' ]; then 
    echo -e "\nThe contents of your home directory are:"; ls
fi