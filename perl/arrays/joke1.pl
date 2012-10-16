#!/usr/bin/perl
#
use warnings;
use strict;

my @questions = qw(Java Python Perl C);
my @punchlines = ("None. Change it once, and it's the same everywhere.","One. He just stands below the socket and the world revolves around him.","A million. One to change it, the rest to try and do it all in one line of code.",'"CHANGE?!!"');

print "Please enter a number between 1 and 4: ";
my $selection = <STDIN>;
$selection = $selection -1;
print $selection, "\n";

print "How many $questions[$selection] ";
print "programmers does it take to change a lightbulb?\n\n";
sleep 2;
print $punchlines[$selection], "\n";
