class activemq::service inherits activemq::params {

  service { 'activemq':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['activemq::pkg'],
    subscribe  => Class['activemq::config'],
  }
}
