#!/usr/bin/perl
#
use strict;
use warnings;

my @required = qw(preserver sunscreen water_bottle jacket);
my %skipper = map { $_, 1 }
qw(blue_shirt hat jacket preserver sunscreen);
foreach my $item (@required) {
    unless ( $skipper{$item} ) { # not found in list?
        print "Skipper is missing $item.\n";
    }
}

