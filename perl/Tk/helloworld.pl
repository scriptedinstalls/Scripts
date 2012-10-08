#!/usr/bin/perl
#
use strict;
use warnings;

use Tk;
my $mw = MainWindow->new;
$mw->Button(-text => "Hello World!", -command =>sub{exit})->pack;
MainLoop;

