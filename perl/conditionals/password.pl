#!/usr/bin/perl
#
use warnings;
use strict;

my $password = "foxtrot";
print "Enter the password :";

my $guess = <STDIN>;
chomp $guess;

if($password eq $guess){
    print "Pass, friend.\n";
}

if($password ne $guess){
    print "Go Away, imposter!\n";
}


