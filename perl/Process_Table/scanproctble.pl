#!/usr/bin/perl
#
#use strict;
#use warnings;
use Proc::ProcessTable;


my $interval = 300;
my $partofhour = 0;

my $tobj = new Proc::ProcessTable;
my %last;
my %current;
my %collection;

while (1) {
    foreach my $process ( @{ $tobj->table } ) {
    next if ( $process->pid() == $$ );
    $current{ $process->pid() } = $process->fname();
    next if ( $last{ $process->pid() } eq $process->fname() );
    $collection{ $process->fname() }++;
}

$partofhour += $interval;
%last = %current;
%current = ();
if ( $partofhour >= 300 ) {
print scalar localtime(time) . ( '-' x 50 ) . "\n";
print "Name\t\tCount\n";
print "--------------\t\t-----\n";
foreach my $name ( sort reverse_value_sort keys %collection ) {
print "$name\t\t$collection{$name}\n";
}
%collection = ();


$partofhour = 0;
}
sleep($interval);
# (reverse) sort by values in %collection and by key name
sub reverse_value_sort {
return $collection{$b} <=> $collection{$a} || $a cmp $b;
}

}
