#!/bin/bash


SITES="google.com"


if [ "$#" = "0" ]
then
    ping -c 2 $SITES > /dev/null
    if [`echo $?` = "0" ]
    then
        echo -e "The server has connectivity"
    else
        echo -e "Check your network connection"
    fi

elif [ "$#" = "1" ]
then
    ping -c 2 $1 > /dev/null
fi
