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

foreach (keys %where) {
    print "$_ lives in $where{$_}\n";
}

