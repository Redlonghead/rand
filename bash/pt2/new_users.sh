#!/bin/bash

# Variables
user_file=$1


print_usage() {
    printf "\tUsage: '$0 <new users file>'\nCreates a new user useing the first letter of first name and full last name from a file ending in .txt\nExample: John Smith -> jsmith\n\n"
}

if [ $# -eq 0 ]; then
    print_usage
elif [[ "$user_file" == *.txt ]] ; then
    # stuff
    cat $user_file | while read user; do 
        echo $user
        # echo "root:$passwd" | sudo chpasswd -m rick
    done
else
    print_usage
    echo "The file you inputed is not a .txt file!"
fi