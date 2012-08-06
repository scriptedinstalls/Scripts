#!/usr/bin/perl
#
#

$os_version = "Ubuntu";
%linux_current_version = ("Ubuntu", "12.04", "Debian", "6.05", "RedHat", "6.3");

    print "$os_version is currently : ";
    print $linux_current_version{"Ubuntu"};
    print "\n";

%build_tools = (
    Python => "2.7.3",
    Perl   => "5.16",
    gcc    => "4.6.3",
    bash  => "4.2.24",
);
my $tool = "Python";
#print "$build_tools: ";
print "$tool : is version : ";
print $build_tools{"$tool"};
print "\n";


