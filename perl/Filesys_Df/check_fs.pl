#!/usr/bin/perl
#
use strict;
use warnings;

use Filesys::Df;

my $fobj = df('/');
print $fobj->{su_bavail}* 1024 . ' bytes of ' .
$fobj->{su_blocks}* 1024 . " bytes free\n";

print $fobj->{user_blocks} / 1024;
print "\n";
print $fobj->{user_bavail} / 1024;


