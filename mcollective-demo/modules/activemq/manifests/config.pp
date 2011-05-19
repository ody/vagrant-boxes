class activemq::config(
  $amq_configfile      = $activemq::params::amq_configfile,
  $amq_configdir       = $activemq::params::amq_configdir,
  $amq_init_configfile = $activemq::params::amq_init_configfile,
  $amq_pidfile         = $activemq::params::amq_pidfile,
  $amq_datadir         = $activemq::params::amq_datadir,
  $amq_logdir          = $activemq::params::amq_logdir,
  $stomp_user          = $activemq::params::stomp_user,
  $stomp_passwd        = $activemq::params::stomp_passwd,
  $stomp_port          = $activemq::params::stomp_port,
  $stomp_admin_user    = $activemq::params::stomp_admin_user,
  $stomp_admin_passwd  = $activemq::params::stomp_admin_passwd
) inherits activemq::params {

  file { 'activemq_conf':
    ensure  => file,
    path    => $amq_configfile,
    content => template('activemq/activemq.xml.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Class['activemq::pkg'],
    notify  => Class['activemq::service'],
  }
}
