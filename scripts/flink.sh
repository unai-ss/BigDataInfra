sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo setenforce 0

wget https://www-eu.apache.org/dist/flink/flink-1.7.2/flink-1.7.2-bin-hadoop28-scala_2.12.tgz
tar -zxvf flink-1.7.2-bin-hadoop28-scala_2.12.tgz
export FLINK_HOME=/home/vagrant/flink-1.7.2/
export PATH=$PATH:$FLINK_HOME/bin
sudo yum install java-1.8.0-openjdk-devel
sudo sed -i 's/^jobmanager.rpc.address: localhost$/jobmanager.rpc.address: flink/g' /home/vagrant/flink-1.7.2/conf/flink-conf.yaml
sudo /home/vagrant/flink-1.7.2/bin/start-cluster.sh
sudo yum install lsof curl wget -y
sudo lsof -i :8081
