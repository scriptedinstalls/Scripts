#!/usr/bin/perl
#
use strict;
use warnings;

use Proc::ProcessTable;

my $tobj = new Proc::ProcessTable;

my $proctable = $tobj->table();

foreach my $process (@$proctable) {
    print $process->pid . "\t" . getpwuid( $process->uid) . "\n";
}


