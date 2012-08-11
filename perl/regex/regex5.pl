#!/usr/bin/perl
#
#
#

$IN = "INFILE";
$OUT = "OUTFILE";
$FILENAMEIN = "data1";
$FILENAMEOUT = "data2";

open ($IN, "$FILENAMEIN") || die "Problems opening file: $!";
open ($OUT, ">$FILENAMEOUT") || die "Problems opening file: $!";

@filecontents = <$IN>;

            foreach (@filecontents) {
                if ( /Full/i ) {
                s/Full/MyFull/;
                print $OUT "$_";
                }

            }

