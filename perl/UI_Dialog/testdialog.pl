#!/usr/bin/perl
#
use strict;
use warnings;

use UI::Dialog::Backend::Zenity;

#my $d = new UI::Dialog::Backend::Zenity ( backtitle => 'Demo',title => 'Default');

my $d = new UI::Dialog::Backend::Zenity( title => 'Default Title', backtitle => 'Backtitle',
                   width => 65, height => 20, listheight => 5 );
$d->msgbox( title => 'Welcome!', text => 'Welcome one and all!');
