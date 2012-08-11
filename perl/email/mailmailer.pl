#!/usr/bin/perl
#
use Mail::Mailer;
$from = "root";
$to = "joeblow";
$subject = "Testing Mail::Mailer perl module";
$body = "This is the body of the email";

$mailer = Mail::Mailer -> new();
$mailer -> open({ From => $from,
                    To => $to,
                    Subject => $subject,
                });
print $mailer $body;


