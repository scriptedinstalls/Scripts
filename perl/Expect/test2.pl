#! /usr/bin/perl

use Expect;
my $script = "ssh -x -l root 192.168.1.100 ls";
my $command = Expect->spawn($script);

my $pid = $command->pid();

print "PID->\n". $pid;

my $password = "computer";

$command->log_stdout(1);

my $timeout=7200;
#Here you have to give pattern which matches with your messages...

while (
$command->expect($timeout,
                -re => 'want to continue connecting',  ## ssh asks confirmation 
                -re => 'password:', # ssh asks for a password.
                -re => 'Secure connection to \S+ refused',
                -re => '^OKc',
             ) ){
        $command->clear_accum();
        print "exp_match_number ->".$command->exp_match_number."\n";
if( not defined($command->exp_match_number) ){
                        print "Error: output not expected, aborting connection\n";
                        #print "#### String received:\n";
                        print $command->exp_before, "\n";
                        $command->hard_close;
                        $retval = 1;
                        print "Retval ->$retval<-\n";
                        return $retval;
                }

                if( $command->exp_match_number == 1 ){
                        # The authentication was not working, tell ssh "yes"
                        # we want to connect
                        print $command "yes\r";
                        next;
                }
                elsif( $command->exp_match_number == 2 ){
                        # Looking for password
                        print $command "$password\r";
                        next;
                }
                elsif( $command->exp_match_number == 3 ){
			print $command->exp_before, "\n";
                        $retval = 0;
                        last;
                }
                elsif( $command->exp_match_number == 4 ){
                        last;
                }
}
print "BEFORE....".$command->exp_before;

$exp_error = $command->exp_error();

if ( defined ($exp_error) ){
        print "Exp Error:$exp_error:\n";
}
