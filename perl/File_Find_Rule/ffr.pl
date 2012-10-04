#!/usr/bin/perl
#
#my @interesting =
#                  File::Find::Rule
#                                  ->file()
#                                  ->executable()
#                                  ->size('<1M')
#                                  ->uid( 6588, 6070 )
#                                  ->name('*.pl')
#                                   ->in('.');
#
#
use File::Find::Rule;

my @files_or_dirs = File::Find::Rule->in('.');

print @files_or_dirs;
print "\n";

my @files = File::Find::Rule->file()->in('.');
print @files;
print "\n";

my @perl_files = File::Find::Rule->file()->name('*.pl')->in('.');
print @perl_files;
print "\n";

my @more_perl_files = find( file => name => '*.pl', in => '/home/joeblow/Scripts/perl/hashes' );
print @more_perl_files;
print "\n";

foreach $myfile (@more_perl_files){
    print "$myfile \n";
}

my $ffr = File::Find::Rule->file()->name('*.pl')->start('/home/joeblow/Scripts/perl');

while ( my $perl_file = $ffr->match ){
        print "$perl_file \n";
     }
    


