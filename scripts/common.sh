#!/bin/bash

#
# Version information is defined the versions.sh file
#
source "/vagrant/scripts/versions.sh"

# java
JAVA_ARCHIVE=jdk-8u51-linux-x64.gz

# hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_VERSION=hadoop-2.6.0
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hadoop/core/$HADOOP_VERSION/$HADOOP_ARCHIVE
HADOOP_RES_DIR=/vagrant/resources/hadoop

# hive
HIVE_VERSION=hive-1.1.0
HIVE_ARCHIVE=apache-$HIVE_VERSION-bin.tar.gz
HIVE_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hive/$HIVE_VERSION/$HIVE_ARCHIVE
HIVE_RES_DIR=/vagrant/resources/hive
HIVE_CONF=/usr/local/hive/conf

# spark
SPARK_VERSION=spark-2.3.0
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.tgz
SPARK_MIRROR_DOWNLOAD=http://archive.apache.org/dist/spark/$SPARK_VERSION/$SPARK_VERSION-bin-hadoop2.6.tgz
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF_DIR=/usr/local/spark/conf

# Zeppelin
ZEPPELIN_RELEASE=zeppelin-${ZEPPELIN_VERSION}-bin-netinst
ZEPPELIN_ARCHIVE=${ZEPPELIN_RELEASE}.tgz
ZEPPELIN_MIRROR_DOWNLOAD=http://www-eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/${ZEPPELIN_ARCHIVE}
ZEPPELIN_RES_DIR=/vagrant/resources/zeppelin
ZEPPELIN_TARGET=/home/vagrant

# ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}
