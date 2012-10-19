#!/usr/bin/perl
#
use strict;
use warnings;

use lib "/home/joeblow/Scripts/perl/MyModules";
use Logger;

Logger::open_log("/var/log/testserver.log");

Logger::write_log(1, "A basic message to the logfile");

Logger::write_log(10, "This won't be written because the log level is too high");

#set the level so that it can receive messages with a higher log level
#

Logger::log_level(10);

Logger::write_log(10, "This one will work because we changed the logging level");

Logger::close_log();
