class { 'webreader': }

webreader::vhost { 'test.local':
  script_name => 'wr',
  wruser      => 'vagrant',
  wrgrp       => 'vagrant',
  nodeapp_dir => '/var/www/wr/dist'
}

#  script_name => 'wr',
#  wruser      => 'vagrant',
#  wrgrp       => 'vagrant',
#  server_name => 'test.local',

