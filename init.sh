#!/bin/sh
echo "**************************"
echo "Installing Build-Essential"
echo "**************************"

# Install Modules (PHP 7.1.X)

# apt-get
echo "**************************"
echo "Install apt-get update.."
echo "**************************"
sudo apt-get -y update
sudo apt-get -y upgrade

# APACHE2
# sudo a2enmod rewrite
echo "**************************"
echo "Install apache2.."
echo "**************************"
sudo apt-get -y install apache2

# php7.0
# sudo apt-cache search php7-* -> php7 modules search
echo "**************************"
echo "Install php7.."
echo "**************************"
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get -y update
sudo apt-get install -y php7.0

# mcrypt
echo "**************************"
echo "Install mcrypt.."
echo "**************************"
sudo apt-get -y install php7.0-mcrypt

# mysql
echo "**************************"
echo "Install mysql.."
echo "**************************"
sudo apt-get -y install php7.0-mysql

# curl
echo "**************************"
echo "Install curl.."
echo "**************************"
sudo apt-get -y install php7.0-curl

# php config setting
echo "**************************"
echo "php config setting.."
echo "**************************"
short_open_tag = On
sed "s/short\_open\_tag\ \=\ Off/short\_open\_tag\ \=\ On/g" /etc/php/7.0/apache2/php.ini > php.ini
yes | mv php.ini /etc/php/7.0/apache2/php.ini

date.timezone = Asia/Seoul
sed "s/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Seoul/g" /etc/php/7.0/apache2/php.ini > php.ini
yes | mv php.ini /etc/php/7.0/apache2/php.ini

sudo a2enmod rewrite

sudo apt-get update
sudo apt-get upgrade

#gcc/g++ 설치
sudo apt-get install gcc
sudo apt-get -y install g++


# install openjdk-8
sudo apt-get purge openjdk*
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install oracle-java8-installer -y


# install ES
curl -L -O  https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.4/elasticsearch-2.3.4.tar.gz


tar -xvf elasticsearch-2.3.4.tar.gz

sudo sysctl -w vm.max_map_count=262144
echo "vagrant soft     nofile         65536" | sudo tee --append /etc/security/limits.conf
echo "vagrant hard     nofile         65536" | sudo tee --append /etc/security/limits.conf
echo "session required pam_limits.so" | sudo tee --append /etc/pam.d/common-session
sudo -H -u vagrant bash -c 'ulimit -n'

# either of the next two lines is needed to be able to access "localhost:9200" from the host os
echo "network.bind_host: 0" >> elasticsearch-2.3.4/config/elasticsearch.yml
echo "network.host: 0.0.0.0" >> elasticsearch-2.3.4/config/elasticsearch.yml
# enable dynamic scripting
echo "script.inline: on" >> elasticsearch-2.3.4/config/elasticsearch.yml
# enable cors (to be able to use Sense)
echo "http.cors.enabled: true" >> elasticsearch-2.3.4/config/elasticsearch.yml
echo "http.cors.allow-origin: /https?:\/\/.*/" >> elasticsearch-2.3.4/config/elasticsearch.yml

sudo chown -R vagrant:vagrant elasticsearch-2.3.4
sudo elasticsearch-2.3.4/bin/plugin install mobz/elasticsearch-head

#sudo elasticsearch/bin/plugin install mobz/elasticsearch-head
wget https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz
tar zxfv mecab-0.996-ko-0.9.2.tar.gz

wget https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.0.1-20150920.tar.gz

tar zxfv mecab-ko-dic-2.0.1-20150920.tar.gz


#sudo elasticsearch-2.3.4/bin/plugin install org.bitbucket.eunjeon/elasticsearch-analysis-seunjeon/2.4.0.0