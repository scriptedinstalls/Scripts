#!/bin/bash

for myvar1 in Test1 Test2 Test3
do
    for myvar2 in Test1 Test2 Test3
    do
        if [ "$myvar1" = "$myvar2" ]
        then
            echo $myvar1 is the same as  $myvar2
        elif [ "$myvar1" != "$myvar2" ]
        then
            echo $myvar1 is not the same as $myvar2
        fi
    done
done
