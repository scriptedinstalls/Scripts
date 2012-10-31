#!/usr/bin/perl

use strict;
use warnings;

use Proc::ProcessTable;

my $FORMAT = "%-6s %-10s %-8s %-24s %s\n";
my $t = new Proc::ProcessTable;
 printf($FORMAT, "PID", "TTY", "STAT", "START", "COMMAND"); 
 foreach my $p ( @{$t->table} ){
   printf($FORMAT, 
          $p->pid, 
          $p->ttydev, 
          $p->state, 
          scalar(localtime($p->start)), 
          $p->cmndline);
 }
