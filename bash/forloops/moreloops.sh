#!/bin/bash

PASSFILE="/etc/passwd"


for user in `cat $PASSFILE | cut -f 1 -d ':'`
do
    echo $user
done
