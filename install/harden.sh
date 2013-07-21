#!/bin/bash
chkconfig autofs off
chkconfig avahi-daemon off
chkconfig avahi-dnsconfd off
chkconfig bluetooth off
chkconfig conman off
chkconfig cups off
chkconfig dhcdbd off
chkconfig firstboot off
chkconfig gpm off
chkconfig haldaemon off
chkconfig isdn off
chkconfig iptables off
chkconfig ip6tables off
chkconfig irda off
chkconfig irqbalance off
chkconfig kdump off
chkconfig kudzu off
chkconfig mcstrans off
chkconfig microcode_ctl off
chkconfig multipathd off
chkconfig netconsole off
chkconfig netfs off
chkconfig netplugd off
chkconfig nfs off
chkconfig nfslock off
chkconfig nscd off
chkconfig pcscd off
chkconfig portmap off
chkconfig rdisc off
chkconfig rhnsd off
chkconfig restorecond off
chkconfig rpcgssd off
chkconfig rpcidmapd off
chkconfig rpcsvcgssd off
chkconfig sendmail off
chkconfig smartd off
chkconfig winbind off
chkconfig wpa_supplicant off
chkconfig xfs off
chkconfig ypbind off
chkconfig yum-updatesd off
chkconfig acpid on
chkconfig anacron on
chkconfig atd on
chkconfig cpuspeed on
chkconfig lvm2-monitor on
chkconfig messagebus on
chkconfig ntpd on
chkconfig network on
chkconfig oracle on
chkconfig oracleasm on
chkconfig readahead_early on
chkconfig readahead_later on
chkconfig syslog on
chkconfig sshd on
cat > /root/banner << EOF
|-----------------------------------------------------------------|
| This system is for the use of authorized users only. |
| Individuals using this computer system without authority, or in |
| excess of their authority, are subject to having all of their |
| activities on this system monitored and recorded by system |
| personnel. |
| |
| In the course of monitoring individuals improperly using this |
| system, or in the course of system maintenance, the activities |
| of authorized users may also be monitored. |
| |
| Anyone using this system expressly consents to such monitoring |
| and is advised that if such monitoring reveals possible |
| evidence of criminal activity, system personnel may provide the |
| evidence of such monitoring to law enforcement officials. |
|-----------------------------------------------------------------|
EOF
cat /root/banner
sed -i 's/id:5:initdefault:/id:3:initdefault:/g' /etc/inittab
sed -i 's/ca::ctrlaltdel:/#ca::ctrlaltdel:/g' /etc/inittab
echo PermitRootLogin no >> /etc/ssh/sshd_config
echo Banner /root/banner >> /etc/ssh/sshd_config
sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding no/g' /etc/ssh/sshd_config
sed -i 's/#X11Forwarding no/X11Forwarding no/g' /etc/ssh/sshd_config
sed -i 's/X11Forwarding yes/#X11Forwarding yes/g' /etc/ssh/sshd_config
sed -i 's/#StrictModes yes/StrictModes yes/g' /etc/ssh/sshd_config
sed -i 's/#IgnoreRhosts yes/IgnoreRhosts yes/g' /etc/ssh/sshd_config
sed -i 's/#HostbasedAuthentication no/HostbasedAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/#RhostsRSAAuthentication no/RhostsRSAAuthentication no/g' /etc/ssh/sshd_config
service sshd restart
echo net.ipv4.conf.all.accept_source_route = 0 >> /etc/sysctl.conf
echo net.ipv4.conf.all.accept_redirects = 0 >> /etc/sysctl.conf
echo net.ipv4.icmp_echo_ignore_broadcasts = 1 >> /etc/sysctl.conf
echo net.ipv4.icmp_ignore_bogus_error_responses = 1 >> /etc/sysctl.conf
echo net.ipv4.conf.all.log_martians = 1 >> /etc/sysctl.conf
sysctl -p
if [ $(id -u) -eq 0 ]; then
read -p "Enter username : " username
read -s -p "Enter password : " password
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo "$username exists!"
exit 1
else
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -m -p $pass $username
[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
fi
else
echo "Only root may add a user to the system"
exit 2
fi

echo "This script can be used for RHEL hardening"
echo " "
sleep 2

echo "1. checking some basic packages which should not be installed:"
for package in inetd xinetd ypserv tftp-server telnet-server rsh-serve
do
      if ! rpm -qa | grep $package >& /etc/null;
      then
      echo "package $package is not installed"
      else
      echo "The $package is installed. Erasing it now."
      yum erase $package
      fi
done
sleep 2
echo " "

echo "2. Checking SElinux settings:"
x=`cat /etc/sysconfig/selinux | grep ^SELINUX | head -n 1 | awk -F= '{print $2}'`
if [ $x == disabled ]
then
    echo "SElinux is disabled"
    echo "Changing it to enforcing"
    sed -i 's/^SELINUX=disabled/SELINUX=enforcing/' /etc/sysconfig/selinux
else
    echo "SElinux is already in enforcing mode"
fi
sleep 2
echo " "

echo "3. Changing different parameters of password aging"
sed -i '/^PASS_MAX_DAYS/c\PASS_MAX_DAYS  60' /etc/login.defs
sed -i '/^PASS_MIN_DAYS/c\PASS_MIN_DAYS  1' /etc/login.defs
sed -i '/^PASS_MIN_LEN/c\PASS_MIN_LEN   8' /etc/login.defs
sed -i '/^PASS_WARN_AGE/c\PASS_WARN_AGE   15' /etc/login.defs
echo "Changes in /etc/login.defs file are done"
sleep 2
echo " "

#echo "Restricting use of previous passwords:"
#echo "None applied"
#sleep 2

echo "4. Verifying empty password accounts:"
x=`awk -F: '($2 == "") {print}' /etc/shadow | wc -l`
if [ $x -lt 1 ]
then
    echo "No account is password less"
else
    echo "At least 1 account is password less.Check the configuration file"
fi
sleep 2
echo " "

echo "5. Checking if No Non-Root Accounts Have UID Set To 0:"
x=`awk -F: '($3 == "0") {print}' /etc/passwd | awk -F: '{print $1}'`
if [ $x == root ]
then
echo "No account other than ROOT has UID 0"
else
echo "***** Check the file. More than one accounts have UID 0"
fi
sleep 2
echo " "

#echo "6. Disabling root login in system"
#sed -i '/^#PermitRootLogin/a PermitRootLogin no' /etc/ssh/sshd_config
#sed -i 's/^#Port 22/Port 2222/' /etc/ssh/sshd_config
#sleep 2

echo "7. Linux kernel hardening:"
cp /etc/sysctl.conf /etc/sysctl.conf.backup
echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.forwarding = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.mc_forwarding = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.log_martians = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog = 4096" >> /etc/sysctl.conf
echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf
sleep 2
echo "Changes in /etc/sysctl.conf file are done."
sleep 1
echo " "

echo "8. Setting permissions to restrictive for commonly used commands"
chmod 100 /bin/rpm
chmod 100 /bin/tar
chmod 100 /bin/gzip
chmod 100 /bin/ping
chmod 100 /bin/gunzip
chmod 100 /bin/mount
chmod 100 /bin/umount
chmod 100 /usr/bin/gzip
chmod 100 /usr/bin/gunzip
chmod 100 /usr/bin/who
chmod 100 /usr/bin/lastb
chmod 100 /usr/bin/last
chmod 100 /usr/bin/lastlog
chmod 100 /sbin/arping
#chmod 100 /usr/sbin/traceroute

#chmod 400 /etc/syslog-ng/syslog-ng.conf
chmod 400 /etc/hosts.allow
chmod 400 /etc/hosts.deny
#chmod 400 /etc/sysconfig/syslog
chmod 644 /var/log/wtmp
echo "commands permissions changed"
sleep 1
echo " "

#echo "Disk partitions:"
#echo "***None applied yet***"
#sleep 2

#echo "disabling IPv6:"
#echo "None applied"
#sleep 2

echo "9. disabling 'lp' and 'game' users in passwd file:"
sed -i 's/^lp/#lp/' /etc/passwd
sed -i 's/^games/#games/' /etc/passwd

sed -i 's/^lp/#lp/' /etc/group
sed -i 's/^games/#games/' /etc/group
echo "Users are disabled"
sleep 1
echo " "

#echo "creating GRUB password:"

#echo "use of gconftool"

#echo "write verify script"

echo "10. Setting 'Banner' and 'Motd'"
echo "*****************************************************************************" > /etc/motd
echo -e "!!!WARNING!!!\n" >> /etc/motd
echo " This System is for the use of authorized company personnel only and by accessing this system  you here by consent to the system being monitored by the company. Any unauthorized use will be considered a breach of company's Information Security Policies and may be unlawful under law. " >> /etc/motd
echo "*****************************************************************************" >> /etc/motd
cp /etc/issue /etc/issue.net
#cp /etc/issue /etc/motd
echo "Banner is set."
sleep 1
echo " "
