#!/usr/bin/perl
#
use strict;
use warnings;


use Proc::ProcessTable;

my $t = new Proc::ProcessTable;

 foreach my $p (@{$t->table}) {
  print "--------------------------------\n";
  foreach my $f ($t->fields){
    print $f, ":  ", $p->{$f}, "\n";
  }
 }       


