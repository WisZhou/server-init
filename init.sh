#!/bin/bash

apt-get update
apt-get install fail2ban
apt-get install git
apt-get install python-pip

# urllib3 ssl support
apt-get install python-dev libffi-dev build-essential libssl-dev

# mysql lib
apt-get install apt-get install libmysqld-dev 

# pip install
pip install virtualenv
