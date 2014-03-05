$base = [ "htop", "pydf", "screen" ]
package { $base:
	  ensure => 'latest',
	}

file { '/home/vagrant/.screenrc':
	source	=> '/vagrant/files/screenrc',
	owner	=> 'vagrant',
	group	=> 'vagrant',
	mode	=> '644',
	require => Package['screen'],
}


class { '::mysql::server':
  root_password => 'root',
}

class { '::mysql::server::account_security': }
