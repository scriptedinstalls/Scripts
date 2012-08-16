#!/usr/bin/python
import string

print range(10)
print range(1,11)


stringlist = ["apples", "oranges","grapes"]
stringlist2 = ["bannanas", "kiwi", "strawberry"]
print stringlist
stringlist.reverse()
print stringlist
stringlist.append(stringlist2)
print stringlist
stringlist.pop()
print stringlist

stringlist.extend(stringlist2)
print stringlist

stringlist.insert(3,"watermelon")
print stringlist

logfile = "20040925 192.168.1.100 1100 192.168.1.111 80 404 index.php"

print logfile

print type(logfile)

logfile2 = string.split(logfile)
print logfile2

logfile3 = logfile2[0:5]

print logfile3

logfile4 = string.join(logfile3)

print logfile4

