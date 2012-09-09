#!/usr/bin/perl -w
use strict;
use Net::PcapUtils;
$,=' ';

my $error = Net::PcapUtils::loop(\&print_packet,
                                 NUMPACKETS => 10,
                                 );
die $error if $error;

sub print_packet {
  my($user_data, $header, $packet) = @_;    
  my $len = length $packet;
  my $i=0;
  do {    
    my $lg = substr $packet, $i, 16;
    printf "%.8X : ", $i;
    $i+=16;
    print unpack ('H2'x16, $lg), '  'x(16-length $lg);
    $lg =~ s/[\x00-\x1F\xFF]/./g;
    print " $lg\n";
  } until $i>=$len;
  print "\n";
}


