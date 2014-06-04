/*Exec["apt-update"] -> Package <| |>

exec { "apt-update":
    command => "/usr/bin/apt-get update",
}

$nginx = "nginx-light"
$base = [ "htop", "pydf", "screen", $nginx ]

#Configure dotdeb repo.
include apt

apt::source { 'dotdeb':
    location   => 'http://packages.dotdeb.org',
    release    => 'wheezy-php55',
    repos      => 'all',
    key        => '89DF5277',
    key_source => 'http://www.dotdeb.org/dotdeb.gpg',
 }->package { $base:
	  ensure   => 'latest',
    require =>  Exec [ 'apt-update'] 	
 }


file { '/home/vagrant/.screenrc':
	source	=> '/vagrant/files/screenrc',
	owner	=> 'vagrant',
	group	=> 'vagrant',
	mode	=> '644',
	require => Package['screen'],
}

file { '/home/vagrant/.bash_aliases':
  source => '/vagrant/files/bash_aliases',
  owner  => 'vagrant',
  group  => 'vagrant',
  mode   => '644',
}
*/

class { 'webreader':
  script_name => 'webreader',
  wruser      => 'vagrant',
  wrgrp       => 'vagrant',
  server_name => 'test.local',
}

