#!/usr/bin/env bash
buffer="
class { 'webreader': }

"
echo "$buffer" > /vagrant/manifests/$1
