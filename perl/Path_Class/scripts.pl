#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;

#my $pcfile = file(qw{home joeblow Scripts perl Path_Class scripts.pl});

my $pcfile = file('/home/joeblow/Scripts/perl/Path_Class/scripts.pl');

my $pcdir = dir(qw{home joeblow Scripts perl Path_Class});

print "$pcfile\n";
print "$pcdir\n";
print $pcfile->dir();
print "\n";
print $pcfile->parent();
print "\n";
print $pcfile->basename();
print "\n";


my $absfile = $pcfile->absolute;
my @contents = $pcfile->slurp;

print "$absfile\n";
#print "@contents";
