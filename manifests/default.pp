Exec["apt-update"] -> Package <| |>

$base = [ "htop", "pydf", "screen" ]
$nginx = "nginx-light"
#$fpm = [ "php5-fpm", "nginx-light" ]

package { $base:
	  ensure   => 'latest',
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

  include apt

  apt::source { 'dotdeb':
    location   => 'http://packages.dotdeb.org',
    release    => 'wheezy-php55',
    repos      => 'all',
    key        => '89DF5277',
    key_source => 'http://www.dotdeb.org/dotdeb.gpg',
 }->package { $nginx:
              ensure => 'latest' 
              }->file { '/etc/nginx/sites-available/default':
                        source => '/vagrant/files/nginx/default',
                        owner  => 'root',
                        group  => 'root',
                        mode   => '644',
                }->service { 'nginx':
                           ensure => 'running' }
include phpfpm

phpfpm::pool { 'www':
      ensure => 'absent',
             }->phpfpm::pool { 'vagrant': 
                  listen => '/var/run/php5-fpm_vagrant.sock',
                  user   => 'vagrant',
                  group  => 'vagrant',
                }


class { '::mysql::server':
  root_password => 'root',
}

class { '::mysql::server::account_security': }

#class { 'apt':
#    always_apt_update               => true,
#    disable_keys                    => undef,
#    proxy_host                      => false,
#    proxy_port                      => '8080',
#    purge_sources_list              => false,
#    purge_sources_list_d            => false,
#    purge_preferences_d             => false,
#    update_timeout                  => undef
#}

