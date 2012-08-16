#!/usr/bin/python





han1 = open("data6","w")

productname = "RedHat"
productcost = 295.50
count = 1

while count <= 100:
     han1.write("%s %.2f %d\n" % (productname, productcost, count))
     productcost = productcost + 1
     count = count + 1




han1.close()



