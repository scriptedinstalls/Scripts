package Logger;

use strict;
use warnings;

use Exporter;
use base 'Exporter';
our @EXPORT = qw(open_log close_log write_log log_level);




my $LEVEL = 1;

sub open_log {
    my $filename = shift;
    open(LOGFILE, '>>', $filename) or die "can't open $filename: $!";
    print LOGFILE "Log started: ", scalar(localtime), "\n";
}

sub close_log {
    close LOGFILE;
}

sub write_log {
    my($level, $message) = @_;
    print LOGFILE "$message\n" if $level <= $LEVEL;
}

sub log_level {
    my $level = shift;
    $LEVEL = $level if $level =~ /^\d+$/;
}

1;

