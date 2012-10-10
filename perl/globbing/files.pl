#!/usr/bin/perl
#
use Cwd;

my $dir = getcwd;

my @files = <*>;

foreach $file (@files){
    print "    $dir/$file\n";
}
