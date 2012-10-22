#!/usr/bin/perl
#
use strict;
use warnings;

foreach my $operator ( qw(+ − * /) ) {
    my $result = eval "2 $operator 2";
    print "2 $operator 2 is $result\n";
}

