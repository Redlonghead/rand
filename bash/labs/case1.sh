#!/bin/bash
clear

echo -e "What would you like to see?\nToday's Date (d)\nCurrently logged in users (u)\nThe content of your home directory (r)\n>>\c"
read promt
case $promt in 
d | D ) echo -e "Today's date is \c"; date ;;
u | U ) echo -e "\nThe people logged into the system include:"; who ;;
r | R ) echo -e "\nThe contents of your home directory are:"; ls ;;
*) echo -e "Invalid choice!\a" ;;
esac