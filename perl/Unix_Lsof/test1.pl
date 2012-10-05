#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;

use Text::Wrap;


my $lsofexec = '/usr/bin/lsof';

my $lsofflag = '-FL0tn';

open our $LSOFPIPE, '-|', "$lsofexec $lsofflag" or die "Unable to start $lsofexec: $!\n";

my $pid;
my $pathname;
my $login;
my $type;
my %seen;
my %paths;


while ( my $lsof = <$LSOFPIPE> ) {
if ( substr( $lsof, 0, 1 ) eq 'p' ) {
	( $pid, $login ) = split( /\0/, $lsof );
	$pid = substr( $pid, 1, length($pid) );
}


if ( substr( $lsof, 0, 5 ) eq 'tVREG' or substr( $lsof, 0, 4 ) eq 'tREG'){
	( $type, $pathname ) = split( /\0/, $lsof );
	next if ( $seen{$pathname} eq $pid );
	$seen{$pathname} = $pid;
	}
}

$pathname = substr( $pathname, 1, length($pathname) );
push( @{ $paths{$pathname} }, $pid );
close $LSOFPIPE;
foreach my $path ( sort keys %paths ) {
print "$path:\n";
print wrap( "\t", "\t", join( " ", @{ $paths{$path} } ) ), "\n";
}

