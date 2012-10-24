#!/usr/bin/perl
#
    use strict;
    use warnings;

my %gilligan_info = (name => 'Gilligan',hat => 'White',shirt => 'Red',position => 'First Mate');
my %skipper_info = (name => 'Skipper',hat => 'Black',shirt => 'Blue',position => 'Captain');

my @crew = (\%gilligan_info, \%skipper_info);


my $hash_ref = \%gilligan_info;

my $name1 = $gilligan_info {'name'};
print "$name1\n";

my $name2 = ${$hash_ref} {'name'};
print "$name2\n";

my $name3 = $$hash_ref{'name'};
print "$name3\n";

my $name4 = ${$crew[0]}{'name'};
print "$name4\n";

my $ref = $crew[0]; 
my $name5 = $$ref{'name'};
my $name6 = $crew[0]->{'name'};
my $name7 = $crew[0]{'name'};

print "$name5\n$name6\n$name7\n";

my @keys1 = keys %gilligan_info;
print "@keys1\n";

my @keys2 = keys %{$hash_ref};
print "@keys2\n";

my @keys3 = keys %$hash_ref;
print "@keys3\n";


my $format = "%-15s %-7s %-7s %-15s\n";
printf $format, qw(Name Shirt Hat Position);

for my $crewmember (@crew) {
    printf $format, @$crewmember{qw(name shirt hat position)};
}























