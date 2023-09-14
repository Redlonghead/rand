#!/bin/bash

building=$1
room=$2
count=24


print_usage() {
    printf "
    Usage:
    'offping [building] [room]' or 'offping -flags'

    Flags:
    -b -> building
    -r -> room number
    -c -> Computer count ending
"
}
if [ $# -eq 0 -o $# -eq 1 ]; then
    print_usage
else
    while getopts 'hr:c:b:' flag; do
        case $flag in
            r) room="${OPTARG}" ;;
            c) count="${OPTARG}" ;;
            b) building="${OPTARG}" ;;
            h) print_usage
                exit 1 ;;
        esac
    done

    echo > .ping_log_temp.txt
    echo $(printf -- '-%.0s' {1..100}) > .ping_error_temp.txt

    for computer in $(seq -w 1 $count); do
        ping -c 1 $building-$room-$computer >> .ping_log_temp.txt 2>> .ping_error_temp.txt
    done

    echo -e "\n                                     Not Responding"
    printf -- '-%.0s' {1..100}
    grep -B 1 "0 received" .ping_log_temp.txt

    echo -e "\n                                     Error with DNS"
    cat -s .ping_error_temp.txt

    rm .ping_log_temp.txt .ping_error_temp.txt
fi