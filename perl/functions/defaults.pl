#!/usr/bin/perl
#
use warnings;
use strict;

log_warning("This is default message number 1","My localtime");
log_warning("This is default message number 2");
log_warning();

sub log_warning {
    my $message = shift || "This is assigned to message if no arguments were passed";
    my $time = shift || localtime;
    print "[$time] $message\n";
}
