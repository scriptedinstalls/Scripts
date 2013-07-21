for blockip in `resolveip facebook.com | cut -d " " -f 6`; do
 iptables -A OUTPUT -o eth0 -p tcp -m tcp -d $blockip -j REJECT --reject-with tcp-reset
 done
