#!/usr/bin/perl
#
use File::Basename;
$fullname = "/home/joeblow/Scripts/perl/echo/test.pl";

           ($name,$path,$suffix) = fileparse($fullname,@suffixlist);
                      $name = fileparse($fullname,@suffixlist);

                                 $basename = basename($fullname,@suffixlist);
                                            $dirname  = dirname($fullname);
print "$name\n";
print "$path\n";
print "$suffix\n";

