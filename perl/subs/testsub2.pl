#!/usr/bin/perl
#
#


open (han1, ">> logfile.sub") || die "Errors opening file: $!";

my $etcdir = `ls -l /etc/passwd`;
chomp $etcdir;
my $message = "Launching this file";



log_message("$message");
log_message("$etcdir");

sub log_message {
    my $current_time = localtime;
    print "$current_time - $_[0]","\n";
    print han1 "$current_time - $_[0]","\n";


}
