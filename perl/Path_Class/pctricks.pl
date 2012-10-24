#!/usr/bin/perl
#
use strict;
use warnings;

use Path::Class;

my $pcfile = file('/home/joeblow/Scripts/perl/Path_Class/pctricks.pl');

print $pcfile->dir();
print "\n";
print $pcfile->parent();
print "\n";
print $pcfile->basename();
print "\n";
