#!/usr/bin/python
import sys

print len(sys.argv)

threshold = 4

if len(sys.argv) < threshold:
     print "Script requires at least", threshold, "arguments"

elif len(sys.argv) >= 8 and len(sys.argv) <= 10:
      print "You have entered way too many arguments"
      print "Thank you!", "You have entered" , len(sys.argv) -1, "arguments"
else:
     print sys.argv[0], "Accepts only 9 arguments"



