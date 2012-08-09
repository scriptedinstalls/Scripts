#!/usr/bin/perl
#
#
#

my $data1 = "dataproducts";


    open (han1, "$data1") || die "Errors opening file $data1 : $!";
    @f1 = <han1>;
    my $total = 0;

    foreach (@f1){
        my @columns = split;
        $total = $columns[3] + $total;

    }
    print "Grand Total for all products found: ", "$total", "\n";
