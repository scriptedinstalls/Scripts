#!/usr/bin/python

import shutil



s = shutil


#s.copy2("data3","data4")
#s.move("data3","temp/data3")

src = "temp"
dst = "temp2"

s.copytree(src,dst)



