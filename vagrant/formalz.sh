#!/usr/bin/env bash
set -euo pipefail
[[ "${DEBUG:-false}" == "true" ]] && set -x

rsync -avh /vagrant/formalz-compose/ /home/vagrant/formalz/
cd /home/vagrant/formalz
if [[ ! -e "/home/vagrant/formalz/formalz-initialized" ]]; then
  ./formalz.sh install
  touch /home/vagrant/formalz/formalz-initialized
fi

cp /vagrant/vagrant/systemd/formalz.service /etc/systemd/system/formalz.service
chmod 644 /etc/systemd/system/formalz.service
systemctl enable formalz
systemctl start formalz