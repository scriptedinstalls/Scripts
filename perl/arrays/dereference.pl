#!/usr/bin/perl
#
use strict;
use warnings;




my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
check_required_items('The Skipper', \@skipper);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
check_required_items('Professor', \@professor);
my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
check_required_items('Gilligan', \@gilligan);


sub check_required_items {
    my $who = shift;
    my $items = shift;
    my %whos_items = map { $_, 1 } @{$items};

my @required = qw(preserver sunscreen water_bottle jacket);
for my $item (@required) {
    unless ( $whos_items{$item} ) { # not found in list?
        print "$who is missing $item.\n";
    }
  }
}
