#!/bin/bash

apt-get update
apt-get install -y fail2ban
apt-get install -y git
apt-get install -y python-pip
apt-get install -y ack-grep

# urllib3 ssl support
apt-get install -y python-dev libffi-dev build-essential libssl-dev

# mysql lib
apt-get install -y libmysqld-dev 

# pip install
pip install -y virtualenv
