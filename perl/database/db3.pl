#!/usr/bin/perl
#
#
use strict;
use DBI;
#Step 1 create connection object
#

my $dsn = 'DBI:mysql:contacts';
my $user = 'root';
my $password = 'railsrocks';

my $conn = DBI->connect($dsn,$user,$password) || die "Error connecting" . DBI->errstr;

open (han1, "dbinsert.txt") || die "Error opening file : $!";
my @newrecords = <han1>;


foreach (@newrecords) {
    my @columns = split;
    my $firstname = $columns[0];
    my $lastname = $columns[1];
    my $zip = $columns[2];

my $query1 = $conn->do("INSERT INTO addressbook(firstname,lastname,zip)VALUES('$firstname','$lastname','$zip')") || die "Error perparing query" . DBI->errstr;

}
