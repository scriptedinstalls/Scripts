#!/usr/bin/python



file = raw_input("Please enter a file name for processing : ")



try:
        han1 = open(file, "r")
except:
        print "Problems opening file", file



print "We have moved on"
print han1.readline()



