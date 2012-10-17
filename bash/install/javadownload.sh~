wget http:///jdk-6u24-linux-x64.bin
mkdir /usr/java
mv jdk-6u24-linux-x64.bin /usr/java
cd /usr/java
chmod 755 jdk-6u24-linux-x64.bin
/tmp/autoinstaller.sh jdk-6u24-linux-x64.bin
echo ”
export JAVA_HOME=/usr/java/jdk1.6.0_24
export PATH=\$JAVA_HOME/bin:\$PATH
” >> /etc/profile

source /etc/profile

rm -rf jdk-6u24-linux-x64.bin;
alternatives –install /usr/bin/java java $JAVA_HOME/bin/java 2
alternatives –set java $JAVA_HOME/bin/java
