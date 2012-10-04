#!/usr/bin/perl

use strict;

my $scalar = 42;

my $refs = \$scalar;

print 'Both $scalar and $refs have the value: ', ${$refs}, ".\n";

my $array_of_hashes[0] =
{ ’Name’ => "Paul Barry",
    ’Book’ => "Programming the Network with Perl",
    ’Year’ => 2002 };



print
print
print
print
"There’s a great book called ";
"${$array_of_hashes[0]}{’Book’} by\n";
"${$array_of_hashes[0]}{’Name’}, published in ";
"${$array_of_hashes[0]}{’Year’}.\n";

