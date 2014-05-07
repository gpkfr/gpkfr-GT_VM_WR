Exec["apt-update"] -> Package <| |>

$nginx = "nginx-light"
$base = [ "htop", "pydf", "screen", $nginx, "php5-cli", "php5-mcrypt" ]
#$fpm = [ "php5-fpm", "nginx-light" ]
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

exec { "apt-update":
    command => "/usr/bin/apt-get update",
}

file { '/etc/nginx/sites-available/default':
                        source  => '/vagrant/files/nginx/default',
                        owner   => 'root',
                        group   => 'root',
                        mode    => '644',
                        require => Package [ $nginx ],
     }->service { 'nginx':
                           ensure => 'running' }
include phpfpm

phpfpm::pool { 'www':
      ensure => 'absent',
             }->phpfpm::pool { 'vagrant': 
                  listen       => '/var/run/php5-fpm_vagrant.sock',
                  user         => 'vagrant',
                  group        => 'vagrant',
                  listen_owner => 'vagrant',
                  listen_group => 'vagrant',
                  listen_mode  => 0666,
                }
                
                #                ->package{ 'php5-mcrypt':
                #  ensure  => 'latest',
                #  require => Exec['apt-update'],
                #}


class { '::mysql::server':
  root_password => 'root',
}

class { '::mysql::server::account_security': }


