#!/usr/bin/perl
#
#
#


$MAIL = "SENDMAIL";

    open($MAIL,"| /usr/sbin/sendmail -oi -t"); 
$BODY = "Testing variable for body of email message"


print $MAIL <<"EOF";
FROM: ANYUSER
TO: joeblow
Subject: Testing mail from perl script

$BODY
EOF
close($MAIL)
