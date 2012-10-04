#!/usr/bin/perl
#
use strict;
use warnings;

use Getopt::Std;

getopt('ab');

our($opt_a, $opt_b);

print "$opt_a\n" if (defined $opt_a);
print "$opt_b\n" if (defined $opt_b);


