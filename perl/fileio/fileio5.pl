#!/usr/bin/perl
#
#
#
$FILEHANDLE = "FILEREADWRITE";
$filename = "data1";
$appendtofile = "Append";
    open( $FILEHANDLE, "ps -ef |" ) || die "The file could not be opened: $!";
  
    @data1contents = <$FILEHANDLE>;

    foreach (@data1contents) {
        if (/getty/){   
        print $_;
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
