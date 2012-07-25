#!/bin/bash
# Author: Your name here
# Purpose: How to create a library of functions 
# Date: Today
#############################################################################

TOP10CPU1=`ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10`

function top10cpu(){

	echo $TOP10CPU1 #ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10
}

function totalcpu(){

	#top bd00.50n2 | grep Cpu | tail -n1 | sed ‘s/.*Cpu(s)://g; s/us,.*//g’
}

function top10mem(){
	
	#ps -A --sort -rss -o comm,pmem,pid,rss | head -n 11

}





#End


