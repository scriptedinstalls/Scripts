#! /usr/bin/perl -w

use Net::PcapUtils;


sub got_a_packet {
my ( $user_arg, $header, $packet ) = @_;
print "Got a packet!\n\n";
print "The user argument is: ", $user_arg, "\n";
print "The header data is:\n";
foreach my $name (sort keys %{$header})
{
print "
$name -> ${header}{$name}\n";
}
print "The packet data is:
", $packet, "\n\n";
}



my $pkt_descriptor = Net::PcapUtils::open;

if ( !ref( $pkt_descriptor ) )
{
print "Net::PcapUtils::open returned: $pkt_descriptor\n";
exit;
}

while( 1 )
# i.e. forever, or until "killed" ...
{
Net::PcapUtils::next( $pkt_descriptor );
got_a_packet;
}

