#!/bin/bash

IP=$1

function disable_apt_interactive_mode() {
    echo "Disabling APT interactive mode..."
	sudo mv -v /etc/apt/apt.conf.d/70debconf /root/etc-apt-apt.conf.d-70debconf.bak
	sudo dpkg-reconfigure debconf -f noninteractive -p critical
}

function setup_apt_repos() {
    echo "Setting up APT repositories for dependencies..."
	add-apt-repository ppa:webupd8team/java

	curl -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -
	echo "deb http://debian.datastax.com/community stable main" | sudo tee /etc/apt/sources.list.d/cassandra.sources.list
}

function update_upgrade_autoremove() {
    echo "Updating and Upgrading system..."
	sudo apt-get update
	sudo apt-get -y upgrade
	sudo apt-get -y dist-upgrade
	sudo apt-get -y autoremove
}

function install_apt_deps() {
    echo "Installing dependencies..."
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo \
		/usr/bin/debconf-set-selections
	sudo apt-get -y install oracle-java8-installer oracle-java8-set-default
}

function setup_cassandra() {
    echo "Configuring Cassandra..."
	sudo apt-get -y install cassandra=2.2.8
	sed "s/||IP||/$IP/g" /tmp/tpl.cassandra.yaml | sudo tee /etc/cassandra/cassandra.yaml
	sleep 30
	sudo service cassandra restart
	sleep 30
}

function setup_keyspace() {
	echo "Creating keyspace..."
	cqlsh $IP -e "CREATE KEYSPACE IF NOT EXISTS test_keyspace WITH REPLICATION = { 'class': 'SimpleStrategy', 'replication_factor': 1 };"
}

if [ ! -e /var/run/bootstrapped ]
then
	disable_apt_interactive_mode
	setup_apt_repos
	update_upgrade_autoremove
	install_apt_deps
	setup_cassandra
	touch /var/run/bootstrapped
fi

setup_keyspace
