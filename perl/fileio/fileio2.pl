#!/usr/bin/perl
#
#
#
$IN = "INFILE";
$OUT = "OUTFILE";
$filenamein = "data1";
$filenameout = "data2";



$fullname = "Full Name";

    open( $IN, "$filenamein") || die "The file could not be opened: $!";
    open( $OUT, ">$filenameout") || die "The file could not be opened: $!";
    @data1contents = <$IN>;

    foreach (@data1contents) {
        if (/Full/) {    
        print $OUT $_;
    }
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    # open( OUTFILE, ">data1") || die "The file could not be opened: $!";
    
    #for (1..20) {
    #
    #    print OUTFILE "$fullname\n";
    #
    #}
    #while (<INFILE>) {
    #    print "$_\n";
    #
    #}
