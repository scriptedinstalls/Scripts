#!/usr/bin/python


import logging
import logging.handlers
import syslog



logger = logging.getLogger()

han = logging.FileHandler('log1.log')
han2 = logging.handlers.SysLogHandler()

format = logging.Formatter('%(levelname)s %(message)s')

han.setFormatter(format)
han2.setFormatter(format)

logger.addHandler(han)
logger.addHandler(han2)

logmessage = "Testing message in python"

logger.error(logmessage)

