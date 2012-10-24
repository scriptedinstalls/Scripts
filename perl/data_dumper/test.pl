#!/usr/bin/perl
#
use strict;
use warnings;

use Data::Dumper; $Data::Dumper::Useqq=1; $Data::Dumper::Sortkeys=1;
push @ARGV, '/usr/share/dict/words' unless @ARGV;
my %h;
while (<>) {
    my $first_letter = lc substr $_, 0, 1;
    $h{$first_letter}++;
}
print Dumper \%h;

