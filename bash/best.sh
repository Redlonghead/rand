#!/bin/bash
# simple script to welcome students to class
clear
echo -e"Hello Linux+ Students\n"
echo -e"My name is John Davis\n"
echo -e"I'm you insttucot for Linux+\n"
echo -e"What is your name?\n"
read name
echo
echo "Welcome to class ${name^}!" # {^} capitilize input
echo
echo