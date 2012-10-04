#!/usr/bin/perl
#

my $homedir = ( getpwuid($<) )[7];

print $homedir;
