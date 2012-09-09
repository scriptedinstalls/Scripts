#!/usr/bin/perl
#

use strict;
use Net::PcapUtils;

sub got_a_packet {
    print "Got a packet!\n";
}

my $status = Net::PcapUtils::loop(\&got_a_packet);

if($status){
    print "Net::PcapUtils::loop returned: $status\n";
}
