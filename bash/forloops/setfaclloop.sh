#!/bin/bash

MYDIR="/home/joeblow/Scripts"


for i in `ls $MYDIR`
do
    for s in user1 user2 user4
    do
        setfacl -Rm u:$s:rwx $i
    done

    echo $i

done
