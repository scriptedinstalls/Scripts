#!/bin/bash


mydate=`date +%b\ %d\ %T`
myhost=`hostname`
mydirname=`dirname $0`
myscript=`basename $0`
mymessage="Success"

echo -e $mydate $myhost $mydirname $myscript $mymessage
