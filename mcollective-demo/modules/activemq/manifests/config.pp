class activemq::config(
  $amq_configfile = $activemq::params::amq_configfile,
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
