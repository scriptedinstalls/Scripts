#!/usr/bin/perl
#
use strict;
use warnings;

my %where = (
    Gary    => "Dallas",
    Lucy    => "Exeter",
    Ian     => "Reading",
    Samantha => "Portland"
);

foreach ( values %where) {
    print "someone lives in $_\n";
}


