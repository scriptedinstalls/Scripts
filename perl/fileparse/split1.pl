#!/usr/bin/perl
#
#


$data4 = "Full:Name";
$lc = 0;
@array1 = split /:/, $data4;

    while(<>){
        print "$_";
        $lc += 1;
    }

    print "The Line Count is equal to : ", "\t", "$lc", "\n";











#   foreach(@array1){
#        print "$_\n";
#    }
