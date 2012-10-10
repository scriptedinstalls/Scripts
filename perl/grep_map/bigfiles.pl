#!/usr/bin/perl
#

use strict;
use warnings;

my @bigfilelist = grep check_filesize($_), @ARGV;
#print @bigfilelist;
my @results = map print_results($_), @bigfilelist;


sub check_filesize {
    my $input = shift;
    my $size = (stat($input))[7] || die "stat($input): $!\n";
        if ($size > 1000){
            return $input;
        }
    
}

sub print_results {
    my $output = shift;
    print "    $output\n";
}
