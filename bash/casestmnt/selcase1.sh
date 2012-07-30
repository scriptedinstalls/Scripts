#!/bin/bash


for myvar in Test1 Test2 Test3 Test4
do
    case $myvar in Test1 )
        echo $myvar ;;
    Test2 )
        echo $myvar ;;
    Test3 )
        echo $myvar ;;
    Test4 ) 
        echo $myvar ;;
    esac

done
