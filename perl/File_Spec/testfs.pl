#!/usr/bin/perl
#
#
use strict;
use warnings;

use File::Spec;
use Cwd;

my $dir = getcwd;
my @files = <*>;

foreach my $myfiles(@files){
    my $path = File::Spec->catfile($dir,$myfiles);
    print "    $path\n";
}
