#!/usr/bin/perl
#
#

$min = 3;
$max = 23;
$value = "Test";

@array1 = ("1","2","3","4");

for ($i=1; $i<=10; $i++) {
        print "$i\n";
    }
    
    for ($min..$max) {print "$value $_\n";}


    foreach (@array1){
        print "$_\n";
    }
