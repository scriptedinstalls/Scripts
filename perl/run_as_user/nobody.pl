#!/usr/bin/perl
#
use strict;
use warnings;

($<,$>) = (getpwnam("nobody"),getpwnam("nobody"));

my $var1 = `whoami`;

print "$var1\n";
print "$<\n";
