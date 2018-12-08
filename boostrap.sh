#!/usr/bin/env bash
apt-get update

# install tools for managing ppa repositories
apt-get -y install software-properties-common unzip vim

# add extra repositories
apt-add-repository -y ppa:ansible/ansible
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# update cache with new repositories data
apt-get update

# upgrade the system
apt-get -y upgrade

# add ansible dependencies
apt-get -y install build-essential libssl-dev libffi-dev python-dev python-pip
update-locale LANG=en_US.UTF-8
pip install --upgrade pip
pip install --upgrade shade

# update ansible
apt-get -y install ansible
apt-get -y install python-shade

# add google cloud sdk
apt-get install -y --allow-unauthenticated google-cloud-sdk 


snap install google-cloud-sdk --classic
#pip install apache-libcloud
# clean up cached packages
apt-get clean all