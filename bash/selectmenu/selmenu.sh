#!/bin/bash

LIST="For_Loop If_then_else Select_Case Echo Quit "
PS3='Please select a choice : '

select i in $LIST
    do
        if [ $i = "For_Loop" ]
        then
            cat /home/joeblow/Scripts/bash/forloops/basicloop.sh
        elif [ $i = "If_then_else" ]
        then
            cat /home/joeblow/Scripts/bash/conditions/iftest.sh
        elif [ $i = "Select_Case" ]
        then
            cat /home/joeblow/Scripts/bash/casestmnt/selcase1.sh
        elif [ $i = "Echo" ]
        then
            cat /home/joeblow/Scripts/bash/how_to_echo/helloworld.sh
        elif [ $i = "Quit" ]
        then
            exit
        fi
    done



    

