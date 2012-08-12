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

my $query1 = $conn->prepare('SELECT * FROM addressbook') || die "Error perparing query" . DBI->errstr;

#Step 3 execute the query
#

$query1->execute || die "Error executing query" . DBI->errstr;

#Step 4 return results
#

my @results;
while (@results = $query1->fetchrow_array()){
#    my $firstname = $results[0];
#    print "$firstname", "\n";
        foreach (@results){
            print "$_", "\n";
        }
}

if ($query1->rows == 0) {
    print "No Records", "\n";
}
