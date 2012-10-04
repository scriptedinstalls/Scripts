#!/usr/bin/perl
use strict;
use warnings;

my %where = (
    Gary    => "Dallas",
    Lucy    => "Exeter",
    Ian     => "Reading",
    Samantha => "Portland"
);

my ($k, $v);

while (($k, $v) = each %where) {
    print "$k lives in $v\n";
}

