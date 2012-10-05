#!/usr/bin/perl

use strict;
use warnings;
use Proc::ProcessTable;

 # Create a new process table object
 my ($pt) = new Proc::ProcessTable;

 # Initialize your process table hash
 my (%pt_hash);

 # Get the fields that your architecture supports
 my (@fields) = $pt->fields;

 # Outer loop for each process id
 foreach my $proc ( @{$pt->table} ) {
    # Inner loop for each field within the process id
    for my $field (@fields) {
       # Add the field to the hash
       $pt_hash{$proc->pid}{$field} = $proc->$field();
    }
 }
