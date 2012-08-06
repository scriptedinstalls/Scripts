#!/usr/bin/perl
#
#
my $firstname = "FirstName";
my $value = "4";
my @array1 = ("1","2","3",);

    print "@array1\n";

my $ppop = pop @array1;
    print "@array1\n";

my $ppop = pop @array1;
    print "@array1\n";

push @array1, $ppop;
    print "@array1\n";

unshift (@array1, "$firstname", "$value"); # Adds value to the beginning of the array
    print "@array1\n";

shift @array1; # removes the first element of the array

    print "@array1\n";


