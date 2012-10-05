#!/usr/bin/perl
#

use Filesys::Df;
my $fobj = df('/');
print $fobj->{su_bavail}* 1024 . ' bytes of ' .
$fobj->{su_blocks}* 1024 . " bytes free\n";


