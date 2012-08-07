#!/usr/bin/perl -w
#
#


$DIR = "/home/jknott/Scripts/perl";
$DIRHANDLE = "HANDLE";


    opendir ($DIRHANDLE, "$DIR") || die "Error opening $DIR: $!";
    @dirlist = readdir($DIRHANDLE);

        foreach (@dirlist) {
            print "$_\n";
        }
