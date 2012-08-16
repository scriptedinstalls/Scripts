#!/usr/bin/python



han1 = open("data1","r")
han2 = open("data2","w")

tempread1 = han1.readlines()

for i in tempread1:
       han2.write(i)

han1.close()
han2.close()


