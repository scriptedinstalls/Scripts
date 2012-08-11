#!/usr/bin/perl
#
#
#
$time = `date +%r`;

$time =~ /(\d\d):(\d\d):(\d\d)\s(.*)/;
$hour = "$1";
$minute = "$2";
$second = "$3";
$tod = "$4";

print "Hour: $hour Minute: $minute Seconds: $second Time of Day  $tod\n";
