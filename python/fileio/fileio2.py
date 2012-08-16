#!/usr/bin/python



# open accepts two arguments. Filename and mode. r for read rb read bindary w write writebinary a for append r+ for read and write
han1 = open("data1","r")
#print han1
print han1.readline()
# read reads into a string the first line up to number of chars in parens \n
# readline will read up to one line per list element
#
tempread1 = han1.readlines()

print type (tempread1)

print tempread1

