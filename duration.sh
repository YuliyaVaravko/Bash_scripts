#!/bin/bash

BEGIN_TIME=$(date +%s%N)
duration(){
        FINISH_TIME=$(date +%s%N)
        DURATION=$((FINISH_TIME-BEGIN_TIME))
        echo "duration is $DURATION ms"
        exit 0
}

while [[ $# != 0 ]]; do
 case $1 in
     -h)
        cat <<-EOF
        Program for measuring duration of command execution
        Please use options:
        - command which execution time you want to measure
        - h help information

         Created by Yuliya Varavko
         yuliya.varavko@gmail.com
EOF
        exit 0
        ;;
      *)
        echo
        $@ && duration || echo "Unknow command" && exit 0
        ;;
 esac
done

exit 0
