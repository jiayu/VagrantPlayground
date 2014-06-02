#install java and ssh
sudo apt-get update
sudo apt-get -y install openjdk-6-jdk openssh-server

#download and extract hadoop
wget -O hadoop.tar.gz http://www.interior-dsgn.com/apache/hadoop/common/hadoop-2.2.0/hadoop-2.2.0.tar.gz 
tar -xzvf hadoop.tar.gz
rm hadoop.tar.gz 

#exporting enviroment variables
echo "
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
export HADOOP_HDFS_HOME=/home/vagrant/hadoop-2.2.0
export HADOOP_COMMON_HOME=/home/vagrant/hadoop-2.2.0
export HADOOP_YARN_HOME=/home/vagrant/hadoop-2.2.0
export HADOOP_MAPRED_HOME=/home/vagrant/hadoop-2.2.0
export PATH=$PATH:/home/vagrant/hadoop-2.2.0/bin:/home/vagrant/hadoop-2.2.0/sbin
" >> /home/vagrant/.bashrc

#copy all the config files to hadoop
cp  /vagrant/yarn-config/* /home/vagrant/hadoop-2.2.0/etc/hadoop
chown -R vagrant:vagrant /home/vagrant/hadoop-2.2.0/

#format namenode
su vagrant -c "/home/vagrant/hadoop-2.2.0/bin/hadoop namenode -format"

#configure ssh passwordless login
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chown -R vagrant:vagrant /home/vagrant/.ssh
su vagrant -c "ssh-keygen -t rsa -P '' -f /home/vagrant/.ssh/id_rsa"
cat /home/vagrant/.ssh/id_rsa.pub >> .ssh/authorized_keys 




