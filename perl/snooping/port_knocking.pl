#!/usr/bin/perl -w
#
# Copyright 2003, Bri Hatch, released under the GPL
#
# watch_dns:
#   A program to watch for inbound DNS queries, and print the
#   source, destination, and requested domain name of the queries.

# You'll need to fill this in with your actual IP address
# (If we didn't restrict the destination IP address, we'd
# catch all our outbound queries too.)
my $MY_IP_ADDRESS='192.168.218.129';

# The unprivileged uid/gid under which we should run.
my $UNPRIV="200";



# No changes required hereafter

use Net::Pcap;
use FileHandle;
use strict;
use English;	# for example purposes only - I prefer obfuscated code.

STDOUT->autoflush(1);

while ( 1 ) {

    my $pid = fork();
    if ( ! defined $pid ) { die "Unable to fork.  Yikes." };

    if ( $pid ) {
        # Parent process (running as root) will wait for
	# child.  If child exits, we'll create another one.
        wait();	
	sleep(1);  # To keep us from respawning too fast if necessary.
    } else {
    	print "Child starting\n";

	# Child process will do actual sniffing.
	# First, create our packet capturing device
        my($pcap_t) = create_pcap();

        unless ( $pcap_t ) {
            die "Unable to create pcap";
        }

        # Let's stop running as root.  Since we already
	# have our pcap descriptor, we can still use it.
        $EGID="$UNPRIV $UNPRIV";	# setgid and setgroups()
        $GID=$UNPRIV;
        $UID=$UNPRIV; $EUID=$UNPRIV;

	# Capture packets forever.
        Net::Pcap::loop($pcap_t, -1, \&process_pkt, 0);

        # Technically, we shouldn't get here since the loop
        # is infinite (-1), but just in case, close and exit.
        Net::Pcap::close($pcap_t);
        exit 1;
    }
}

sub create_pcap {
    my $promisc = 0;   # We're only looking for packets destined to us,
                       # so no need for promiscuous mode.
    my $snaplen = 135; # Allows a max of 80 characters in the domain name

    my $to_ms = 0;			# timeout
    my $opt=1;                          # Sure, optimisation is good...
    my($err,$net,$mask,$dev,$filter_t);

    my $filter = "udp dst port 53 and dst host $MY_IP_ADDRESS";

    # Look up an appropriate device (eth0 usually)
    $dev = Net::Pcap::lookupdev(\$err);
    $dev or die "Net::Pcap::lookupdev failed.  Error was $err";
    
    if ( (Net::Pcap::lookupnet($dev, \$net, \$mask, \$err) ) == -1 ) {
        die "Net::Pcap::lookupnet failed.  Error was $err";
    }
    
    # Actually open up our descriptor
    my $pcap_t = Net::Pcap::open_live($dev, $snaplen, $promisc, $to_ms, \$err);
    $pcap_t || die "Can't create packet descriptor.  Error was $err";
    
    if ( Net::Pcap::compile($pcap_t, \$filter_t, $filter, $opt, $net) == -1 ) {
        die "Unable to compile filter string '$filter'\n";
    }

    # Make sure our sniffer only captures those bytes we want in
    # our filter.
    Net::Pcap::setfilter($pcap_t, $filter_t);

    # Return our pcap descriptor
    $pcap_t;
}

# Routine to process the packet -- called by Net::Pcap::loop()
# every time an appropriate packet is snagged.
sub process_pkt {
    my($user_data, $hdr, $pkt) = @_;

    my($src_ip) = 26;           # start of the source IP in the packet
    my($dst_ip) = 30;           # start of the dest IP in the packet
    my($domain_start) = 55;     # start of the domain in the packet
    my($data);

    # extract the source IP addr into dotted quad form.
    my($source) = sprintf("%d.%d.%d.%d",
        ord( substr($pkt, $src_ip, 1) ),
        ord( substr($pkt, $src_ip+1, 1) ),
        ord( substr($pkt, $src_ip+2, 1) ),
        ord( substr($pkt, $src_ip+3, 1) ));

    # extract the destination IP addr into dotted quad form.
    my($destination) = sprintf("%d.%d.%d.%d",
        ord( substr($pkt, $dst_ip, 1) ),
        ord( substr($pkt, $dst_ip+1, 1) ),
        ord( substr($pkt, $dst_ip+2, 1) ),
        ord( substr($pkt, $dst_ip+3, 1) ));

    $data = substr($pkt, $domain_start);

    $data =~ s/\00.*//g;             # strip off everything after the domain
    $data =~ s/[^-a-zA-Z0-9]/./g;    # change the domain component separators
                                     # back int to dots.

    print "$source -> $destination: $data\n"
    	if ( $source and $destination and $data);  
}


