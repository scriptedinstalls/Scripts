#!/usr/bin/perl
#
$#ARGV +=1;
$REQPARAM = 3;

    print "$ARGV[0] $ARGV[1] $ARGV[2]\n";

    unless ($#ARGV == $REQPARAM) {
            print "$0 requires $REQPARAM arguments\n";
        }
        
        

