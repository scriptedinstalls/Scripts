print "Enter Hostname: ";
$hostName = ;
chomp($hostName);

print "Enter IP address: ";
$ipAddr = ;
chomp($ipAddr);

print "Enter Netmask: ";
$netMask = ;
chomp($netMask);

print "Enter Gateway: ";
$gateWay = ;
chomp($gateWay);

print "Enter BootProto: ";
$bootProto = ;
chomp($bootProto);

open ( OUT, ">/etc/sysconfig/network-scripts/ifcfg-eth0");
$output .= "DEVICE=eth0\n";
$output .= "BOOTPROTO=$bootProto\n";
$output .= "DHCPCLASS=\n";
$output .= "ONBOOT=yes\n";
$output .= "IPADDR=$ipAddr\n";
$output .= "NETMASK=$netMask\n";
$output .= "GATEWAY=$gateWay\n";
print OUT $output;
close OUT;

open ( OUT2, ">/etc/sysconfig/network");
$output2 .= "NETWORKING=yes\n";
$output2 .= "NETWORKING_IPV6=no\n";
$output2 .= "HOSTNAME=$hostName.thebestjobintheworld.local\n";
print OUT2 $output2;
close OUT2;


print "Preparing for kernel tuning parameters";
open ( OUT3, ">/etc/sysctl.conf");
$output3 .= "# Kernel sysctl configuration file for Red Hat Linux\n";
$output3 .= "# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and\n";
$output3 .= "# sysctl.conf(5) for more details.\n";
$output3 .= "# Controls IP packet forwarding\n";
$output3 .= "net.ipv4.ip_forward = 0\n";
$output3 .= "# Controls source route verification\n";
$output3 .= "net.ipv4.conf.default.rp_filter = 1\n";
$output3 .= "# Do not accept source routing\n";
$output3 .= "net.ipv4.conf.default.accept_source_route = 0\n";
$output3 .= "# Controls the System Request debugging functionality of the kernel\n";
$output3 .= "kernel.sysrq = 0\n";
$output3 .= "# Controls whether core dumps will append the PID to the core filename\n";
$output3 .= "# Useful for debugging multi-threaded applications\n";
$output3 .= "kernel.core_uses_pid = 1\n";
$output3 .= "# Controls the use of TCP syncookies\n";
$output3 .= "net.ipv4.tcp_syncookies = 1\n";
$output3 .= "# Controls the maximum size of a message, in bytes\n";
$output3 .= "kernel.msgmnb = 65536\n";
$output3 .= "# Controls the default maxmimum size of a mesage queue\n";
$output3 .= "kernel.msgmax = 65536\n";
$output3 .= "# Controls the maximum shared segment size, in bytes\n";
$output3 .= "kernel.shmmax = 68719476736\n";
$output3 .= "#Controls the maximum number of shared memory segments, in pages\n";
$output3 .= "kernel.shmall = 4294967296\n";
print OUT3 $output3;
close OUT3;  
