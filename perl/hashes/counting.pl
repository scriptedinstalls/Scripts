#!/usr/bin/perl
#
use strict;
use warnings;

my @names = qw(
    John Sue Larry
    Mary John Mary
    Larry John Joe
    Lisa John Mary
    );

my %count;

foreach (@names){
    if (exists $count{$_}){
        $count{$_}++;
    } else {
        $count{$_} = 1;
    }
}

foreach (keys %count) {
    print "$_ \t occurs $count{$_} times \n";
}
