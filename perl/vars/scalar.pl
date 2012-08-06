#!/usr/bin/perl
#
#

my $firstname = "Billy Bob";
my $lastname = "Smith";
my $age = 29;
our $count = 1;
    print "$firstname $lastname is $age years\n";
    print "Please enter your favorite color? : ";
    my $favoritecolor = <STDIN>;
    print "My favorite color is $favoritecolor";

#Block Definition
    #
{
    my $firstname = "New User";
    my $age = "2";

    print "My name is $firstname and my age is $age\n";
    print "Count is still $count\n";

}

    print "$firstname $lastname is still $age years\n";
