#!/bin/bash

while true; do 
    clear
    echo -e "What would you like to do?
    Add an entry (a)
    Search an entry (s)
    Quit (q)
    Enter your choice (a/s/q) ->\c"
    read answer
    case $answer in
    a|A) echo -e "Name of the family member ->\c"
         read name
         echo -e "Family member's relation to you ->\c"
         read relation
         echo -e "Family member's telephone number ->\c"
         read phone
         echo -e "$name\t$relation\t$phone" >> database
         ;;
    s|S) echo -e "what word would you like to look for? ->\c"
         read word
         grep $word database
         sleep 4
         ;;
    q|Q) exit
         ;;
    *) echo "You must enter either the letter a,s or q."
       sleep 4
       ;;
    esac
done