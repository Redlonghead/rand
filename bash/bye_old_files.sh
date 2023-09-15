#!/bin/bash

# Varibles
ARG1=''
ARG2=''

print_usage() {
    printf "
    Usage: '$0 <> <>' or '$0 -flags'
    short desc
    
    Flags:
        -a -> filler
        -b -> filler
"
}

# Run if there are arguments/flags
if [ $# -eq 0 -o $# -eq 1 ]; then
    print_usage
else
    while getopts 'ab:h' flag; do
        case $flag in
            a) ARG1="true" ;;
            b) ARG2="${OPTARG}" ;;
            h) print_usage
                exit 1 ;;
            *) print_usage
               exit 1 ;;
        esac
    done

    # Stuff

fi