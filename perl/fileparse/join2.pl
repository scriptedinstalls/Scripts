#!/usr/bin/perl
#
#
#


    open (HAN1, ">data4a") || die "Problem opening file $!";
    while(<>) {
        @array1 = split /\s+/, $_;
        $newarray1 = join ",", @array1;
        print "New records are delimited by \",\":"," $newarray1\n";
        print HAN1  $newarray1;
    }
