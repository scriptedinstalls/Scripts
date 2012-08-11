#!/usr/bin/perl
#
#
#

$var1 = "Ready 1 2 3 4";


$var1 =~ /(\s\d)(\s\d)(\s\d)(\s\d)/;
print "$1 $2 $3 $4\n"
