#!/usr/bin/perl
#
use strict;
use warnings;

use Proc::ProcessTable;
my $logfile = 'badapp';
open my $LOG, '>>', $logfile or die "Can't open logfile for append:$!\n";
my $t = new Proc::ProcessTable;
foreach my $p ( @{ $t->table } ) {
if ( $p->fname() =~ /vmware/i ) {
print $LOG time . "\t"
. getpwuid( $p->uid ) . "\t"
. $p->fname() . "\n";
}
}
close $LOG;

