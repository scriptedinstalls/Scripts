#!/usr/bin/perl
#
#


    open (HAN1, "data4") || die "Error opening data1 file $!";

    while(<HAN1>) {
            push @array1, [ split ];
        }

        foreach (@array1) {
            print "@$_\n";

        }
    
    print "$array1[0][0]\t $array1[0][1]\n";
