#!/usr/bin/perl
#
use strict;
use warnings;
use DBM::Deep;


my $db = new DBM::Deep( file => "foo-array.db", type => DBM::Deep::TYPE_ARRAY);

$db->[0] = "foo";
push @$db, "bar", "baz";
unshift @$db, "bah";

my $last_element = pop @$db; #baz
my $first_element = shift @$db; #bah
my $second_element = $db->[1]; #bar

my $num_elements = scalar @$db;

print "$last_element $first_element $second_element $num_elements";

foreach my $data (@$db) {
    print "$data  \n";
}
