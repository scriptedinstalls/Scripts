#!/usr/bin/perl -w
use strict;

sub factorial {
  my ($n) = @_;
  return 1 if $n == 0;
  return factorial($n-1) * $n;
}

my $results = factorial(4);
print $results;
