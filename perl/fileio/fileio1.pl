#!/usr/bin/perl
#
#
#
    $fullname = "Full Name";

    open( INFILE, "data1") || die "The file could not be opened: $!";
    # open( OUTFILE, ">data1") || die "The file could not be opened: $!";
    
    #for (1..20) {
    #
    #    print OUTFILE "$fullname\n";
    #
    #}
    while (<INFILE>) {
        print "$_\n";

    }
