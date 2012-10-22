#!/usr/bin/perl
#
use strict;
use warnings;

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @skipper_with_name = ('Skipper' =>  \@skipper);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @professor_with_name = ('Professor' => \@professor);
my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
my @gilligan_with_name = ('Gilligan' => \@gilligan);


my @all_with_names = (\@skipper_with_name,\@professor_with_name,\@gilligan_with_name);

print "$all_with_names[0][0] \n";

print "=====> $all_with_names[0][1][0] \n";
print "=====> $all_with_names[0][1][1] \n";
print "=====> $all_with_names[0][1][2] \n";
print "=====> $all_with_names[0][1][3] \n";
print "=====> $all_with_names[0][1][4] \n";


print "$all_with_names[1][0] \n";

print "=====> $all_with_names[1][1][0] \n";
print "=====> $all_with_names[1][1][1] \n";
print "=====> $all_with_names[1][1][2] \n";
print "=====> $all_with_names[1][1][3] \n";
print "=====> $all_with_names[1][1][4] \n";

print "$all_with_names[2][0] \n";

print "=====> $all_with_names[2][1][0] \n";
print "=====> $all_with_names[2][1][1] \n";
print "=====> $all_with_names[2][1][2] \n";
print "=====> $all_with_names[2][1][3] \n";

for my $person (@all_with_names) {
    my $who = $$person[0];
    my $provisions_reference = $$person[1];
    print "$who =====> $provisions_reference\n";
}

