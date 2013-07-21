#! /bin/sh

#########################################
###                                    ##
### file: twitter-facebook-blocker.sh  ##
###                                    ##
#########################################

# dns servers to use (preferably your internet service provider dns)
dns_server='127.0.0.1'

# enter websites to be block separated by single space
websites='facebook.com www.facebook.com apps.facebook.com ar-ar.facebook.com pt-pt.facebook.com es-es.facebook.com developers.facebook.com fr-fr.facebook.com de-de.facebook.com pt-br.facebook.com tr-tr.facebook.com m.facebook.com www.twitter.com twitter.com api.twitter.com support.twitter.com mobile.twitter.com dev.twitter.com music.twitter.com ads.twitter.com business.twitter.com platform.twitter.com pic.twitter.com'

# executables path
x_dig=/usr/bin/dig
x_sed=/bin/sed
x_grep=/bin/grep
x_iptables=/sbin/iptables
x_ip6tables=/sbin/ip6tables
x_ipsave=/sbin/iptables-save
x_ip6save=/sbin/ip6tables-save

# error
x_error=0

# check-requirments
if [ ! -x $x_dig ];then
	echo "Error: (dig) is not found"
	x_error=1
fi
if [ ! -x $x_sed ];then
	echo "Error: (sed) is not found"
	x_error=1
fi
if [ ! -x $x_grep ];then
	echo "Error: (grep) is not found"
	x_error=1
fi

if [ ! -x $x_iptables ];then
	echo "Error: (iptables) is not found"
	x_error=1
fi

if [ ! -x $x_ip6tables ];then
	echo "Error: (ip6tables) is not found"
	x_error=1
fi

if [ ! -x $x_save ];then
	echo "Error: (iptables-save) is not found"
	x_error=1
fi

if [ ! -x $x_save6 ];then
	echo "Error: (ip6tables-save) is not found"
	x_error=1
fi



# any error?
if [ $x_error -gt 0 ];then
	exit 1;
fi

# get old rules, to prevent dublicated entries
save=`$x_ipsave`
save6=`$x_ip6save`

# our nasty function :P
firewall_updater()
{
	ips=""
	ipcount=0
	for x in $1;do
		for y in `$x_dig @$dns_server $x IN A | $x_sed -rn 's/.*\sA\s+(([0-9]{1,3}\.){3}[0-9]{1,3})\s*/\1/p'`;do
			if test `echo $save | $x_grep -c $y` -eq 0 && test `echo $ips | $x_grep -c $y` -eq 0;then
				$x_iptables -A  OUTPUT -d "$y" -j REJECT
				ips=" $ips $y"
				ipcount=`expr $ipcount + 1`
			fi
		done
		for z in `$x_dig @$dns_server $x IN AAAA | $x_sed -rn 's/.*\sAAAA\s+([^\s]+)\s*/\1/p'`;do
			if test `echo $save6 | $x_grep -c $z` -eq 0 && test `echo $ips | $x_grep -c $z` -eq 0;then
				$x_ip6tables -A OUTPUT -d "$z" -j REJECT
				ips=" $ips $z"
				ipcount=`expr $ipcount + 1`
			fi
		done

	done

}


echo "Updating (iptables/ip6tables) rules to block ($websites) ... "
firewall_updater "$websites"

if test $ipcount -eq 0; then
	echo "DONE no ip addresses added"
else
	echo "SUCCESS $ipcount ip addresse(s) added"
fi

exit 0
