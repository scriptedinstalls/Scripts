#!/usr/bin/perl
use strict;
use warnings;

my %where = (
    Gary    => "Dallas",
    Lucy    => "Exeter",
    Ian     => "Reading",
    Samantha => "Portland"
);

print "Gary exists in the hash \n" if exists $where{Gary};


