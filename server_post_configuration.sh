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

install_docker () {
  apt install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
  apt update
  apt-cache policy docker-ce
  apt install docker-ce --assume-yes
  systemctl status docker
}

clean () {
    apt autoremove
}
main () {
	update_distribution
	install_base_packages
	install_speedtest
	install_angular
	install_docker
	clean
	set_defaults
}


main