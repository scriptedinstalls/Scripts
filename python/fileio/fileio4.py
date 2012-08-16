#!/usr/bin/python




print " Please enter the file name you would like to read from"
f1 = raw_input()

print " Please enter the file name you would like to write to"
f2 = raw_input()



han1 = open(f1,"r")
han2 = open(f2,"a")

tempread1 = han1.readlines()

han2.writelines(tempread1)



han1.close()
han2.close()


