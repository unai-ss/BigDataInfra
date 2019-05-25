!/bin/bash
sudo systemctl status kafka
echo 'INSTALLER: java 1.8 jdk + jre'
echo 'INSTALLER: Going to reboot to get updated system'
sudo yum install java-1.8.0-openjdk-devel
#sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.rpm"
#sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jre-8u191-linux-x64.rpm"
#wget https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.rpm
#cd /home/vagrant
#sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.rpm"
#echo 'Instalar Java 8 JRE y JDK'
#sudo rpm -i /home/vagrant/jdk-8u201-linux-x64.rpm
#sudo rpm -i localinstall jre-8u201-linux-x64.rpm
#export JAVA_HOME=/usr/java/jdk1.8.0_201-amd64
#export JRE_HOME=/usr/java/jdk1.8.0_201-amd64/jre
#export PATH=$PATH:/usr/java/jdk1.8.0_201-amd64/bin:/opt/jdk1.8.0_201-amd64/jre/bin
#sudo sh -c "echo JAVA_HOME=/usr/java/jdk1.8.0_201-amd64 >> /etc/environment"
#sudo sh -c "echo JRE_HOME=/usr/java/jdk1.8.0_201-amd64/jre >> /etc/environment"
#sudo sh -c "echo PATH=$PATH:/usr/java/jdk1.8.0_201-amd64/bin:/opt/jdk1.8.0_201-amd64/jre/bin >> /etc/environment"
