#!/usr/bin/perl
#
use warnings;
use strict;

my @band = qw(Crosby Stills Nash Young);
my $ref = \@band;

print "Band members before: @band\n";
pop @{$ref};
print "Band members after: @{$ref}\n";


