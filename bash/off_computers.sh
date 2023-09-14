#!/bin/bash

# Varibles
none="true"
building=$1
room=$2
count=24

print_usage() {
    printf "\n\tUsage: '$0 <building> <room>' or '$0 -flags'\n\tLists the IP's that do not ping back\n\n\tFlags:\n\t\t-b -> building\n\t\t-r -> room number\n\t\t-c -> Computer count ending (default 24)\n"
}

# Run if there are arguments/flags
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
            *) print_usage
               exit 1 ;;
        esac
    done

    # Create Logs and ping computers
    echo > .ping_log_temp.txt
    printf -- '-%.0s' {1..100} > .ping_error_temp.txt

    for computer in $(seq 1 "$count"); do
        printf -v computer "%02d\n" "$computer"
        ping -c 1 $building-$room-$computer >> .ping_log_temp.txt 2>> .ping_error_temp.txt
    done

    # Print Logs if needed
    if grep -q "0 received" .ping_log_temp.txt; then
        none="false"
        echo -e "\n                                     Not Responding"
        printf -- '-%.0s' {1..100}
        grep -B 1 "0 received" .ping_log_temp.txt
    fi
    
    if grep -qve "$(printf -- '-%.0s' {1..100})" .ping_error_temp.txt; then
        none="false"
        echo -e "\n                                     Error with DNS"
        cat -s .ping_error_temp.txt
    
    fi

    if [ "$none" = "true" ]; then
        echo -e "\n All computer in $building-$room are online :)\n"
    fi

        rm .ping_log_temp.txt .ping_error_temp.txt
fi