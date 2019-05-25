sudo yum install  -y curl which lsof telnet nmap-ncat wget
sudo rpm --import https://packages.confluent.io/rpm/5.1/archive.key
sudo cat << EOF >/etc/yum.repos.d/confluent.repo
[Confluent.dist]
name=Confluent repository (dist)
baseurl=https://packages.confluent.io/rpm/5.1/7
gpgcheck=1
gpgkey=https://packages.confluent.io/rpm/5.1/archive.key
enabled=1

[Confluent]
name=Confluent repository
baseurl=https://packages.confluent.io/rpm/5.1
gpgcheck=1
gpgkey=https://packages.confluent.io/rpm/5.1/archive.key
enabled=1
EOF
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF

sudo yum clean all &&  sudo yum install confluent-community-2.11 telegraf -y
wget https://github.com/rhuss/jolokia/releases/download/v1.6.0/jolokia-1.6.0-bin.tar.gz
tar -zxvf jolokia-1.6.0-bin.tar.gz
sudo cp /home/vagrant/jolokia-1.6.0/agents/jolokia-jvm.jar /var/lib/kafka/
sudo sed -i '/^export KAFKA_LOG4J_OPTS$/a export KAFKA_JMX_OPTS="-javaagent:/var/lib/kafka/jolokia-jvm.jar=port=8778,host=192.168.32.50 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=$RMI_HOSTNAME -Dcom.sun.management.jmxremote.rmi.port=$JMX_PORT"' /bin/kafka-server-start
sudo sed -i '/^export KAFKA_LOG4J_OPTS$/a export RMI_HOSTNAME=192.168.32.50' /bin/kafka-server-start
sudo sed -i '/^export KAFKA_LOG4J_OPTS$/a export JMX_PORT=9999' /bin/kafka-server-start
sudo bash -c 'echo '\n listeners=PLAINTEXT://0.0.0.0:9092' >> /etc/kafka/server.properties'
sudo bash -c 'echo '\n advertised.listeners=PLAINTEXT://10.211.55.102:9092' >> /etc/kafka/server.properties'
sudo systemctl start confluent-zookeeper
sudo yum install java-1.8.0-openjdk-devel
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sleep 5
sudo systemctl start confluent-kafka
sleep 5
sudo systemctl start confluent-schema-registry
sleep 5
sudo systemctl start confluent-ksql
sleep 5
sudo systemctl start confluent-kafka-rest
echo "#### TEST ZOOKEEPER"
echo ruok | nc 127.0.0.1 2181
echo "####  LIST TOPICS"
kafka-topics --list --zookeeper 127.0.0.1:2181
echo "#### CREATE TEST TOPIC "
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
echo "#### LIST TOPIC TEST"
kafka-topics --list --zookeeper localhost:2181
echo "#### CURL SCHEMA REGISTRY"
curl -X GET http://localhost:8081/config
echo "#### CURL TEST KSQL - curl -sX GET http://localhost:8088/info"
curl -sX GET "http://localhost:8088/info"
echo "#### CURL TEST JOLOKIA PORT 8778"
curl http://localhost:8778/jolokia/version
