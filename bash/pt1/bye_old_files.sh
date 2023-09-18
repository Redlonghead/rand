#!/bin/bash

# Varibles
dir=$1
c_year=$(date +%Y)
y_flag='false'

print_usage() {
    printf "
    Usage: '$0 <file to check>' or '$0 -flags'
    deletes files that are 1 year old in the specified directory.
    
    Flags:
        -f -> file to check
        -y -> auto say yes to delete files
"
}

# Run if there are arguments/flags
if [ $# -eq 0 ]; then
    print_usage
else
    while getopts 'yf:h' flag; do
        case $flag in
            f) dir="${OPTARG}" ;;
            y) y_flag='true' ;;
            h) print_usage
                exit 1 ;;
            *) print_usage
               exit 1 ;;
        esac
    done

    for file in $(ls -1d $dir); do
        date=$(date +%Y -r $file)
        if [ $date -lt $c_year ]; then
            if $y_flag = "true"; then
                rm $file
            else
                echo -e "remove $file? (y/n) ->\c"; read ans
                if [ $ans = 'y' ]; then
                    rm $file
                fi
            fi
        fi
    done
fi