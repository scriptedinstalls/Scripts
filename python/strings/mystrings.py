#!/usr/bin/python

import string

message = "new string"
message2 = "new string"

print message
print "contains ", len(message), "characters"
print "The first character in message is ", message[0]
print "Example of slicing message", message, "is",  message[0:4]

for letter in message:
     print letter

if message == message2:
     print "They match!"


message = string.upper(message)
print message

message = string.lower(message)
print message

print string.capitalize(message)

print string.capwords(message)

print string.split(message)

print string.join(message)


