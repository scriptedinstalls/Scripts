#!/usr/bin/perl
#
use strict;
use warnings;

 my ($name, $passwd, $uid, $gid, $quota,$comment, $gcos, $dir, $shell) = getpwnam("nobody");
           print "Name = $name\n";
              print "Password = $passwd\n";
                 print "UID = $uid\n";
                    print "GID = $gid\n";
                       print "Quota = $quota\n";
                      print "Comment = $comment\n";
                     print "Gcos = $gcos\n";
                    print "HOME DIR = $dir\n";
                   print "Shell = $shell\n";''
