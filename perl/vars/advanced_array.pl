#!/usr/bin/perl
#
#


@array1 = (["1","2"],["3","4"],["5","6"]); # Multidimension 
$array1 = [["1","2"],["3","4"],["5","6"]]; # Array by reference

    print "$array1[0][0]\n";
    print "$array1[0][1]\n";
    print "$array1[1][0]\n";
    print "$array1[1][1]\n";
    print "$array1[2][0]\n";
    print "$array1[2][1]\n";

    print "$array1->[0][0]\n";
    print "$array1->[0][1]\n";
    print "$array1->[1][0]\n";
    print "$array1->[1][1]\n";
    print "$array1->[2][0]\n";
    print "$array1->[2][1]\n";


