#!/usr/bin/perl

use strict;
use warnings;

use Expect;

my $expect      = Expect->new;
my $command     = 'install.sh';
my @parameters  = qw(-f my_conf -p my_ip -s my_server);
my $timeout     = 200;
my $password    = "W31C0m3";

$expect->raw_pty(1);  
$expect->spawn($command, @parameters)
    or die "Cannot spawn $command: $!\n";

$expect->expect($timeout,
		[   qr/Enter password for the packagekey:/i, #/
                    sub {
                        my $self = shift;
                        $self->send("$password\n");
                        exp_continue;
                    }
                ]);


