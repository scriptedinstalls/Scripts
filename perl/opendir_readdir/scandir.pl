#!/usr/bin/perl -s
#
use strict;
use warnings;

use Cwd;

$|=1;

sub ScanDirectory {
    my $workdir = shift;

    my $startdir = cwd;

    chdir $workdir or die "Unable to enter dir $workdir: $!\n";

    opendir my $DIR, '.' or die "Unble to open $workdir: $!\n";

    my @names = readdir $DIR;
    closedir $DIR;  

    foreach my $name (@names) {
        next if ($name eq '.');
        next if ($name eq '..');

        if ( -d $name ) {
            ScanDirectory($name);
            next;
        }
        CheckFile($name) or print cwd. '/' . $name . "\n";
        
    }
    chdir $startdir or die "Unable to change to dir $startdir:$!\n";
}

sub CheckFile{
    my $name = shift;

    print STDERR 'Scanning ' . cwd . '/' . $name . "\n";

    #attemp to read the directory entry for this file
    #
    my @stat = stat($name);
    if ( !$stat[4] && !$stat[5] && !$stat[6] && !$stat[7] && !$stat[8]) {
        return 0;
    }
    #attemp to open this file
    open my $T, '<', "$name" or return 0;

    for (my $i = 0; $i < $stat[7]; $i++) {
        my $r = sysread( $T, my $discard, 1);
        if ($r != 1) {
            close $T;
            return 0;
        }
    }
    close $T;
    return 1;
}

ScanDirectory('/home/joeblow/Scripts');



















