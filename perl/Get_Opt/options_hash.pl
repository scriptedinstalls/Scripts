#!/usr/bin/perl
#
use strict;
use warnings;

use Getopt::Std;

my %opt;

getopt('ab', \%opt);

print "$opt{a}\n" if (defined $opt{a});
print "$opt{b}\n" if (defined $opt{b});


