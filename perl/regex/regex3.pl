#!/usr/bin/perl
#
#


@array1 = ("Full Name", "Full Name");


          foreach(@array1) {
            s/MyFull\s/MyFull/; # removes space between words
            print "$_\n";
        }

