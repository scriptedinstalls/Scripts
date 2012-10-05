my $ssh = Net::SSH::Expect->new(host=>$ip,
                                        user=>$user,
                                        password=>$pass,
                                        raw_pty=>1 ) or die " Cannot Open ";

        $login_check=$ssh->login();
        print "LOGIN for $ip -- $login_check \n";

        my $who = $ssh->exec('who am i ');
        print "\n OUT1 $who \n";

        my $ls = $ssh->exec('touch /tmp/YES_net ');
        print "\n OUT2 - $ls \n";

        $ssh->exec("stty raw -echo");
        $passwd = "sprintdream";
        $tmp1 = $ssh->send("su root -c 'touch /tmp/YESIDIDIT'  ");
        $tmp2 = $ssh->waitfor('Password:\s*\z', 3) or die "prompt 'password' not found after 1 second";
        #$tmp3 = $ssh->send("su root -c whoami ");
        $tmp3 = $ssh->send("$passwd");

        print " Output ==>1  $tmp1 2 $tmp2  3 $tmp3  \n";
        #while ($chunk = $ssh->peek(1)) { # grabs chunks of output each 1 second
        #    #print $ssh->eat($chunk);
        #       print " Chunk => $chunk \n";
        #}

        while ( defined ($line = $ssh->read_line()) ) {
            print " Line => $line " . "\n";
        }

