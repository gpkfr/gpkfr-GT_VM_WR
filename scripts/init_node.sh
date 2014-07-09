#!/usr/bin/env bash
buffer="
class { 'webreader': 
  bypass_node => false,
}

"
echo "$buffer" > /vagrant/manifests/$1
