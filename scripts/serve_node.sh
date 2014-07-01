#!/usr/bin/env bash
echo "->>> $8 <<<-"

block="
# $1

webreader::vhost { '$3':
  script_name => '$1',
  node_port   => '$2',
  wruser      => '$4',
  wrgrp       => '$5',
  nodeapp_dir => '$6',
  server_js   => '$7
  root_dir    => '$8',
  vagrant     => true
  }

"

echo "$block" >> "/vagrant/manifests/$9"
