#!/bin/bash

LENGTH=10
NUMBER=5
while getopts "h n:l:" opt; do
  case $opt in
     h)
        cat <<-EOF
        Script for password generator
        Please use options:
         -l  length of password (default  10)
         -n  number of passwords (default  5)
         -h  help information
        Created by Yuliya Varavko
        yuliya.varavko@gmail.com
        EOF
        exit 0
        ;;
     n)
       NUMBER=$OPTARG
       ;;
     l)
       LENGTH=$OPTARG
       ;;
     *) echo "invalid argument"
        exit 1
      ;;
  esac
done
pwgen -cn1 $LENGTH  $NUMBER
