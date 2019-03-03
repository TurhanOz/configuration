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
  apt-get --assume-yes install python3-pip git npm nodejs lm-sensors nload
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

install_clients () {
  apt-get install mysql-client
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

install_docker_compose () {
  curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

clean () {
    apt autoremove
}
main () {
	update_distribution
	install_base_packages
	install_speedtest
	install_angular
	install_clients
	install_docker
	install_docker_compose
	clean
	set_defaults
}


main