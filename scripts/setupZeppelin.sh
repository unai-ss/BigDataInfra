#!/bin/bash

source "/vagrant/scripts/common.sh"

function installLocalZeppelin {
	echo "install apache Zeppelin from local file"
	FILE=/vagrant/resources/$ZEPPELIN_ARCHIVE
	tar -xzf $FILE -C ${ZEPPELIN_TARGET}
        echo tar -xzf $FILE -C ${ZEPPELIN_TARGET}
}

function installRemoteZeppelin {
	echo "install apache zeppelin from remote file"
	curl ${CURL_OPTS} -o /vagrant/resources/$ZEPPELIN_ARCHIVE -O -L $ZEPPELIN_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$ZEPPELIN_ARCHIVE -C ${ZEPPELIN_TARGET}
}

function setupZeppelin {
	echo "Setup additional Zeppelin interpreters "
	${ZEPPELIN_TARGET}/zeppelin/bin/install-interpreter.sh --name md,shell,file,jdbc
}


function changeOwner {
	echo "Changing owner of zeppelin directories"
	#chown -R -L vagrant:vagrant ${ZEPPELIN_TARGET}/zeppelin
	#chown -R  vagrant:vagrant ${ZEPPELIN_TARGET}/zeppelin
}

function setupEnvVars {
	echo "creating zeppelin  environment variables"
	cp -f $ZEPPELIN_RES_DIR/zeppelin.sh /etc/profile.d/zeppelin.sh
	./etc/profile.d/zeppelin.sh
}

function installZeppelin {
	echo ${ZEPPELIN_TARGET}/$ZEPPELIN_RELEASE ${ZEPPELIN_TARGET}/zeppelin
	echo hoooolaaa
	echo $ZEPPELIN_ARCHIVE
	if resourceExists $ZEPPELIN_ARCHIVE; then
		installLocalZeppelin
	else
		installRemoteZeppelin
	fi
	echo ${ZEPPELIN_TARGET}/$ZEPPELIN_RELEASE ${ZEPPELIN_TARGET}/zeppelin
	ln -s ${ZEPPELIN_TARGET}/$ZEPPELIN_RELEASE ${ZEPPELIN_TARGET}/zeppelin
}

function copyConf {
	cp ${ZEPPELIN_RES_DIR}/zeppelin-site.xml ${ZEPPELIN_TARGET}/zeppelin/conf/.
}

echo "setup Zeppelin"

installZeppelin
setupEnvVars
setupZeppelin
changeOwner
copyConf
sudo /home/vagrant/zeppelin/bin/zeppelin-daemon.sh start

echo "zeppelin setup complete"
