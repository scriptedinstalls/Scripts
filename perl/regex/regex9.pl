#!/usr/bin/perl
#
#


@array1 = ("might", "night", "right", "tight");

        foreach (@array1){
            if (/[mnrt]ight/){
                print "$_\n";
            }

        }
