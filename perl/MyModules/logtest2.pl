#!/usr/bin/perl
# Logger.pm uses Exporter so the script can call them as local functions.
#
#
use strict;
use warnings;

use lib "/home/joeblow/Scripts/perl/MyModules";
use Logger;

open_log("/var/log/testserver.log");

write_log(1, "A basic message to the logfile");

write_log(10, "This won't be written because the log level is too high");

#set the level so that it can receive messages with a higher log level
#

log_level(10);

write_log(10, "This one will work because we changed the logging level");

close_log();
