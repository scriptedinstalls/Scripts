#!/bin/bash

jdkBinFile=$1

echo $1

# just spew out the agreement
perl -p -i -e 's/^more/cat/g' $1

# set the 'agreed' value for jdk 1.5
perl -p -i -e 's/\s+agreed=$/agreed=1/g' $1

# set the agree value for jdk 1.6
perl -p -i -e 's/`agree`/yes/g' $1

# do not call the register_jdk method
perl -p -i -e 's/\s+register_JDK/#register_JDK/g' $1

# and now run the installation
bash $1
