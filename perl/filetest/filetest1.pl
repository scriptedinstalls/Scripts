#!/usr/bin/perl
#

$file = "test";

    if (-e "$file") {
        print "The file exists!\n";
    } else {
        print "The file does not exists!\n";
    }
