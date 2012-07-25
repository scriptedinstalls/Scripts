#!/bin/bash
# Author: Your name here
# Purpose: How to create a library of functions 
# Date: Today
#############################################################################

TOP10CPU1=`ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10`
TOP10MEM1=`ps -A --sort -rss -o comm,pmem,pid,rss | head -n 11`
DISKIO1=`iostat -d -x 5 3`

function top10cpu(){
        clear
	echo "$TOP10CPU1" #ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10
}

function top10mem(){
	clear
	echo "$TOP10MEM1" #ps -A --sort -rss -o comm,pmem,pid,rss | head -n 11
}

function diskio(){
	clear
	echo "$DISKIO1" #iostat -d -x 5 3
}


#End


