#!/usr/bin/perl

use strict;
use warnings;

use LWP::UserAgent;
use HTTP::Request;
use HTTP::Response;
my $ua = new LWP::UserAgent;
my $request = new HTTP::Request('GET', $ARGV[0]);
my $response = $ua->request($request);
if ($response->is_success) {
    print $response->content;
} else {
    print $response->error_as_HTML;
}






