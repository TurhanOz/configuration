#!/usr/bin/env bash

update_distribution () {
  apt-get --assume-yes update
  apt-get --assume-yes upgrade
}

upgrade_distribution () {
  apt-get --assume-yes update
  apt-get --assume-yes dist-upgrade
}

install_base_packages () {
  apt-get --assume-yes install python3-pip git npm nodejs lm-sensors
}

install_speedtest () {
  pip3 install speedtest-cli
}

install_angular () {
  npm install -g @angular/cli
}

set_defaults () {
  update-alternatives --set editor /usr/bin/vim.basic
}


main () {
	update_distribution
	install_base_packages
	install_speedtest
	install_angular
	set_defaults
}


main