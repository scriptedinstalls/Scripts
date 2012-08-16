#!/usr/bin/python
import string
import sys

list1 = ["Redhat", "Debian","Ubuntu", "Arch", "Gentoo", "FreeBSD"]

for i in list1:
     print i

string1 = "Linux"

for i in string1:
     print i

logfile = ["20040925 192.168.1.100 3950", "20040925 192.168.1.111 42500"]
logfile2 = []
for i in logfile:
     logfile2.extend(string.split(i))
     print logfile2


