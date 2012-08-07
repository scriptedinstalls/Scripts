#!/usr/bin/perl
#
#
#
$FILEHANDLE = "FILEREADWRITE";
$filename = "data1";
$appendtofile = "Append";
    open( $FILEHANDLE, "+<$filename") || die "The file could not be opened: $!";
  
    @data1contents = <$FILEHANDLE>;

    foreach (@data1contents) {
        #s/Full/MyFull/;   
        print $FILEHANDLE $_;
         }

         print $FILEHANDLE "$appendtofile\n";
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
