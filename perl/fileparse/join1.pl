#!/usr/bin/perl
#
#




my @array1 = ("My ","Full ","Name ");

my $newarray1 = join ":", @array1; # join interposes delimeter between array elements

    print "New delimiter should be \":\" ", "$newarray1", "\n";
