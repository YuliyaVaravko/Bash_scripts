#!/bin/bash

opt_name=0
opt_memory=0
opt_state=0


display(){
  for i in /proc/[0-9]*

  do
    number="$(cat $i/status | grep "NSpid" | cut -f2) "
    printf  " $number"
    if ((opt_name)); then
      name="$(cat $i/status | grep "Name" | cut -f2)"
      printf "$name"
    fi
    if ((opt_memory)); then
      memory="$(cat $i/status | grep "VmSize" | cut -f2)"
      if [[ -z $memory ]]; then
        memory="--- "
      fi
      printf  " %s" "$memory"
    fi
    if ((opt_state)); then
      state="$(cat $i/status | grep "State" | cut -f2)"
      printf "$state"
    fi
    echo
  done | sort -n | column -t
  }

if [[ $# -eq 0 ]]
  then
  opt_name=1
  opt_memory=1
  opt_state=1
  display
  exit 0
fi

while [[ $# != 0 ]]; do
  case $1 in
    -h)
        cat <<-EOF
        This program provides a list of running processes.
        Please use options:
        - n  display name of process
        - s  display name of state
        - m  display name of memory
        - h  help information

         Created by Yuliya Varavko
         yuliya.varavko@gmail.com
EOF
    exit 0
    ;;
    -n|--name)
    opt_name=1
    ;;
    -m|--memory)
    opt_memory=1
    ;;
    -s|--state)
    opt_state=1
    ;;
    *)
    echo -e "$1 option is not found!"
    exit 1
    ;;
  esac
done

display
exit 0
