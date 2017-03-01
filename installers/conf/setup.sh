#!/bin/bash

# General Updates
#apt-get update

# Install utils
#apt-get install -y vim nano emacs

# Install OpenSSH
#apt-get install -y openssh-server &&
#mkdir /var/run/sshd &&
#echo 'root:admin' | chpasswd &&
#sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config &&
#sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config &&
#echo "export VISIBLE=now" >> /etc/profile &&

#Install unzip
#dpkg -i /installers/packages/unzip* &&


# Install JDK from /installers/packages/
tar -zxvf /installers/packages/jdk* -C /opt/ &&
ln -s /opt/jdk* /opt/jdk &&
#echo "export JAVA_HOME=/opt/jdk" >> /root/.bashrc &&
#echo "export PATH=$PATH:/opt/jdk/bin" >> /root/.bashrc &&
#export JAVA_HOME=/opt/jdk &&
#export PATH=$PATH:/opt/jdk/bin &&

# Install Liferay from /assets/packages/
#apt-get install -y unzip &&
unzip /installers/packages/liferay* -d /opt/ &&
ln -s /opt/liferay* /opt/liferay &&
ln -s /opt/liferay/tomcat* /opt/liferay/tomcat &&


#Clean installers
rm -rf /installers/packages &&

exit $?
