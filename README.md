Vagrant for Data tools
=======================

# Introduction

Vagrant project to spin up a single virtual machine running:

* Hadoop 2.7.2
* Hive 1.2.1
* Spark 1.6.0
* Kafka (Confluent 2.11)
* Flink 1.7.2
* Zeppelin 0.8.1

The virtual machine will be running the following services:

* HDFS NameNode + NameNode
* YARN ResourceManager + JobHistoryServer + ProxyServer
* Hive metastore and server2
* Spark history server
* Kafka Consumer/Producer 1 Broker
* Flink
* Zeppelin

# Getting Started

1. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Download and install Vagrant](http://www.vagrantup.com/downloads.html).
  # List of individual VM
    * nodehdfs1 - HDFS, Hive, Spark
    * nodekafka1 - Kafka
    * nodeflink1 - Flink Zeppelin
3. Run ```vagrant up``` to create  all the VM.
    * Run ```vagrant up node<VM>```to create a VM.
4. Execute ```vagrant ssh``` to login to the VM.
    * Run ```vagrant ssh node<VM>```to create a VM.


# Web user interfaces

Here are some useful links to navigate to various UI's:

* YARN resource manager:  (http://10.211.55.101:8088)
* Job history:  (http://10.211.55.101:19888/jobhistory/)
* HDFS: (http://10.211.55.101:50070/dfshealth.html)
* Spark history server: (http://10.211.55.101:18080)
* Spark context UI (if a Spark context is running): (http://10.211.55.101:4040)
* Zeppelin Web UI on node HDFS (http://10.211.55.101:8080)
* Kafka Plaintext port (10.211.55.102:9092)
* Flink Web UI (http://10.211.55.103:8081)
* Zeppelin Web UI on node Flink (http://10.211.55.103:8080)

# Validating your virtual machine setup

To test out the virtual machine setup, and for examples of how to run
MapReduce, Hive and Spark, head on over to [VALIDATING.md](VALIDATING.md).

# Starting services in the event of a system restart

Currently if you restart your VM then the Hadoop/Spark/Hive services won't be
up (this is something I'll address soon).  In the interim you can run the
following commands to bring them up:

```
$ vagrant ssh
$ sudo -s
$ /vagrant/scripts/start-hadoop.sh
$ nohup hive --service metastore < /dev/null > /usr/local/hive/logs/hive_metastore_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &
$ nohup hive --service hiveserver2 < /dev/null > /usr/local/hive/logs/hive_server2_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &
$ /usr/local/spark/sbin/start-history-server.sh
```


# More advanced setup

If you'd like to learn more about working and optimizing Vagrant then
take a look at [ADVANCED.md](ADVANCED.md).

# For developers

The file [DEVELOP.md](DEVELOP.md) contains some tips for developers.

# Credits

This project is based on the great work carried out at
(https://github.com/vangj/vagrant-hadoop-2.4.1-spark-1.0.1).
This project is based on the great work carried out at
(https://github.com/alexholmes/vagrant-hadoop-spark-hive).
