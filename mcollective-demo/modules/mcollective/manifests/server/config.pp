class mcollective::server::config(
  $stomp_server = $mcollective::params::stomp_server,
  $stomp_user   = $mcollective::params::stomp_user,
  $stomp_passwd = $mcollective::params::stomp_passwd
) inherits mcollective::params {

  file { 'server_config':
    path    => '/etc/mcollective/server.cfg',
    content => template('mcollective/server.cfg.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    notify  => Class['mcollective::server::service'],
    require => Class['mcollective::server::pkg'],
  }

}
