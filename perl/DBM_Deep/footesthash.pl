#!/usr/bin/perl
#
use strict;
use warnings;

use DBM::Deep;

my $db = new DBM::Deep "foo.db";

$db->{mykey} = "myvalue";
$db->{myhash} = {};
$db->{myhash}->{subkey} = "subvalue";

print $db->{myhash}->{subkey} . "\n";

print $db->{mykey} . "\n";

foreach my $key (keys %$db) {
    print "$key : " . $db->{$key} ."\n";
}

while (my ($key, $value) = each %$db) {
    print "$key:  $value\n";
}
