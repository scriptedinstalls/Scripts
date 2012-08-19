#!/usr/bin/python


import logging

logger = logging.getLogger()

han = logging.FileHandler('log1.log')

format = logging.Formatter('%(asctime)s %(levelname)s %(message)s')

han.setFormatter(format)

logger.addHandler(han)

logmessage = "Testing message in python"

logger.error(logmessage)

