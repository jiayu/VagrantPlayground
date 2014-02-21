sudo apt-get update
sudo apt-get -y install openjdk-6-jdk openssh-server


#wget http://www.interior-dsgn.com/apache/hadoop/common/hadoop-2.2.0/hadoop-2.2.0.tar.gz 
#tar -xzvf hadoop/hadoop-2.2.0.tar.gz

#exporting enviroment variables
echo "
export HADOOP_HDFS_HOME=/home/vagrant/hadoop-2.2.0
export HADOOP_COMMON_HOME=/home/vagrant/hadoop-2.2.0
export HADOOP_YARN_HOME=/home/vagrant/hadoop-2.2.0
export HADOOP_MAPRED_HOME=/home/vagrant/hadoop-2.2.0
export PATH=$PATH:$HADOOP_COMMON_HOME/bin:$HADOOP_COMMON_HOME/sbin
" >> /home/vagrant/.bashrc

mkdir dfs

#copy all the config files to hadoop
cp  /vagrant/yarn-config/* /home/vagrant/hadoop-2.2.0/etc/hadoop


