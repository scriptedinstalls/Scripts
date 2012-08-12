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

    my $firstname = "Joeby";

my $query1 = $conn->do("UPDATE addressbook SET firstname='$firstname' WHERE firstname='Joe'") || die "Error perparing query" . DBI->errstr;
my $query1 = $conn->do("DELETE FROM  addressbook WHERE firstname='George'") || die "Error perparing query" . DBI->errstr;


