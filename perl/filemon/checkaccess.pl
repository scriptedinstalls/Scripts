#!/usr/bin/perl -w
#
#
#
use strict;

my @filelist = `ls -A /etc`;

foreach (@filelist) {
    chomp;
    # print "$_\n";
    my @stats = stat($_);
    (my $atime, my $mtime) = ($stats[8], $stats[9]);
    print "$atime $mtime";
}
