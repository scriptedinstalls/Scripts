use Net::OpenSSH;

   for my $host (@hosts) {
     my $ssh = Net::OpenSSH->new($host, user => $user, passwd => $passwd);
     if ($ssh->error) {
       warn "unable to connect to $host: ". $ssh->error;
       next;
     }
     my $date = $ssh->capture('date');
     print "$host: $date";
   }
