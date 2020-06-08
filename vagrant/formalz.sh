#!/usr/bin/env bash
set -euo pipefail
[[ "${DEBUG:-false}" == "true" ]] && set -x

###
### Install analytics
###
RAGE_ANALYTICS_VERSION=impress-1.0.0
RAGE_ANALYTICS_DOWNLOAD_URL=https://github.com/e-ucm/rage-analytics/releases/download/${RAGE_ANALYTICS_VERSION}/rage-analytics_${RAGE_ANALYTICS_VERSION}.tar.gz
RAGE_ANALYTICS_SHA256=0e994a982263eba497f71ff07665ef0def54f7d5561f1684789b77c3fb4bacce
curl -fsSL "$RAGE_ANALYTICS_DOWNLOAD_URL" -o /tmp/rage-analytics.tar.gz;
echo "$RAGE_ANALYTICS_SHA256 /tmp/rage-analytics.tar.gz" | sha256sum -c -;
mkdir /home/vagrant/rage-analytics
tar -xzf /tmp/rage-analytics.tar.gz --strip-components=1 -C /home/vagrant/rage-analytics > /dev/null 2>&1;
cd /home/vagrant/rage-analytics
if [[ ! -e "/home/vagrant/rage-analytics/impress-initialized" ]]; then
  ./formalz.sh
  touch /home/vagrant/rage-analytics/impress-initialized
  cd /home/vagrant/rage-analytics && ./rage-analytics.sh stop
fi

cp /home/vagrant/rage-analytics/vagrant/systemd/rage-analytics.service /etc/systemd/system/rage-analytics.service
chmod 644 /etc/systemd/system/rage-analytics.service
systemctl enable rage-analytics
systemctl start rage-analytics

###
###
###

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