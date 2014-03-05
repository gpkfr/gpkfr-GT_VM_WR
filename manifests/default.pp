Exec["apt-update"] -> Package <| |>

$base = [ "htop", "pydf", "screen" ]

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
