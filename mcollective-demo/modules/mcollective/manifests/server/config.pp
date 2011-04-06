class mcollective::server::config {

  file { 'server_config':
    path    => '/etc/mcollective/server.cfg',
    source  => 'puppet:///modules/mcollective/etc/mcollective/server.cfg',
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    notify  => Class['mcollective::server::service'],
    require => Class['mcollective::server::pkg'],
  }

}
