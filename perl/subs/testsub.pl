#!/usr/bin/perl
#
#
#


mytestsub("MyFirstName", "MyLastName");


sub mytestsub {
    my $test = "$_[0] $_[1]\n";
    print "$test\n";
    my $othertest = "@_\n";
    print "$othertest\n";
    print "This is being called from mytestsub\n";


}



