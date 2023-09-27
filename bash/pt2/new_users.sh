#!/bin/bash

# Variables
user_file=$1
delimiter=';'

print_usage() {
    printf "\tUsage: '$0 <new users file>'\nCreates a new user using the first letter of first name and full last name from a file ending in .txt (names need to be seperated by ';' by default)\nExample: John;Smith -> jsmith\n\n"
}

if [ $# -eq 0 ]; then
    print_usage
elif [[ "$user_file" == *.txt ]] ; then
    # stuff
    cat $user_file | while read new_user; do 
        new_user=$(echo $new_user | tr '[:upper:]' '[:lower:]')
        first=$(echo $new_user | cut -d $delimiter -f 1 )
        last=$(echo $new_user | cut -d $delimiter -f 2 )
        user=$(echo $first | cut -c1 )$last
        passwd="tests"
        echo $user
        # echo "root:$passwd" | sudo chpasswd -m $user
    done
else
    print_usage
    echo "The file you inputed is not a .txt file!"
fi

