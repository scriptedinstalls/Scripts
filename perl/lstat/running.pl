#!/usr/bin/perl
#
use strict;
use warnings;

opendir my $PROC, '/proc' or die "Unable to open /proc:$!\n";

for my $process (grep /^\d+$/, readdir($PROC)){
    print "$process\t" . getpwuid((lstat "/proc/$process")[4]). "\n";
}

closedir $PROC;


