#!/usr/bin/perl

use Text::Wrap;

$lsofexec = "/usr/bin/lsof"; # location of lsof executable

# (F)ield mode, NUL (0) delim, show (L)ogin, file (t)ype and file (n)ame
$lsofflag = "-FL0tn"; 
open(LSOF,"$lsofexec $lsofflag|") or  die "Unable to start $lsof:$!\n";

while(<LSOF>){
    # deal with a process set
    if (substr($_,0,1) eq "p"){
        ($pid,$login) = split(/\0/);
        $pid = substr($pid,1,length($pid));
    }

    # deal with a file set, note: we are only interested 
    # in "regular" files
    if (substr($_,0,5) eq "tVREG"){
        ($type,$pathname) = split(/\0/);

        # a process may have the same path name open twice, 
        # these two lines make sure we only record it once
        next if ($seen{$pathname} eq $pid);
        $seen{$pathname} = $pid;

        $pathname = substr($pathname,1,length($pathname));
        push(@{$paths{$pathname}},$pid);
    }
}

close(LSOF);

for (sort keys %paths){
    print "$_:\n";
    print wrap("\t","\t",join(" ",@{$paths{$_}})),"\n";
}
