#!/usr/bin/perl
#
use warnings;
use strict;


print "A system call automatically sends the output to stdout\n";
my $error_status = system 'date';
my $mydate = `date`;
print "\n";


print "Using backticks saves the data in a variable: $mydate";


print "system() returned: $error_status\n";

