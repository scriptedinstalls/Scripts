#!/usr/bin/perl
#
#

checkstatus();

sub checkstatus {

    my $DIR = "/home/joeblow/Scripts";
    opendir(HAN1, "$DIR") || die "Problem : $!";
    my @array1 = readdir(HAN1);
    if ("$#array1" > 1 ) {
        for ( my $i =0;$i < 2; $i++) { shift @array1;}
        MailNewFiles(@array1);
    } else { print " No new files! \n";}
}

sub MailNewFiles {
use Mail::Mailer;
my $from = "root";
my $to = "joeblow";
my $subject = " New files have been added ";


my $mailer = Mail::Mailer ->new();
    $mailer->open({ From => $from,
                    To => $to,
                    Subject => $subject,
                });

my $header = "New Files";

print $mailer $#_ + 1;
print $mailer "$header\n";
foreach (@_) { print $mailer "$_\n";}
}

