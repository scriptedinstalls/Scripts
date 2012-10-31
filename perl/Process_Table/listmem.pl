#!/usr/bin/perl
#
use strict;
use warnings;

use Proc::ProcessTable;

my $t = new Proc::ProcessTable;

foreach my $p (@{$t->table}) {
    if ($p->pctmem > 10) {
        print $p->pid "\t" . $p->pctmem "\t" . getpwuid($p->uid)"\n";
    }
}
