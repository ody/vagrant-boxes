class mcollective::client::config(
  $stomp_server = $mcollective::params::stomp_server,
  $stomp_user   = $mcollective::params::stomp_user,
  $stomp_passwd = $mcollective::params::stomp_passwd
) inherits mcollective::params {

  file { 'client_config':
    path    => '/home/vagrant/.mcollective',
    content => template('mcollective/client.cfg.erb'),
    mode    => '0600',
    owner   => 'vagrant',
    group   => 'vagrant',
    require => Class['mcollective::client::pkg'],
  }

}
