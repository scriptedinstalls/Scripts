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

#Step 2 define query
#
my $firstname = "Joe";
my $lastname = "Blow";



my $query1 = $conn->do("INSERT INTO addressbook(firstname,lastname)VALUES('$firstname','$lastname')") || die "Error perparing query" . DBI->errstr;


