#!/usr/bin/env bash


###Install nginx, php
export DEBIAN_FRONTEND=noninteractive
#export APTARGS="-qq -o=Dpkg::Use-Pty=0"

apt-get clean 
apt-get update
apt-get upgrade -y

apt-get -y install nginx php-fpm unzip
