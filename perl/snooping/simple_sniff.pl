#!/usr/bin/perl

# Load modules
use Net::PcapUtils;
use NetPacket::Ethernet qw(:strip);
use NetPacket::TCP;
use NetPacket::IP qw(:strip);

# Are you r00t?
if($> != 0)
{
die "You need EUID 0 to use this tool!\n\n";
}

# Start sniffin in promisc mode
Net::PcapUtils::loop(\&sniffit,
Promisc => 1,
FILTER => 'tcp',
DEV => 'eth0');

# Callback
sub sniffit
{
my ($args,$header,$packet) = @_;
$ip = NetPacket::IP->decode(eth_strip($packet));
$tcp = NetPacket::TCP->decode($ip->{data});

print "$ip->{src_ip}:$tcp->{src_port} --> $ip->{dest_ip}:$tcp->{dest_port}\n";
}
