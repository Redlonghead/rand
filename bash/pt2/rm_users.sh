#!/bin/bash

cat $1 | while read user; do 
    sudo userdel $user -r
done