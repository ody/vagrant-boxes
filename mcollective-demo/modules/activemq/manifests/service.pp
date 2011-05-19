class activemq::service {

  service { 'activemq':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['activemq::pkg'],
    subscribe  => Class['activemq::config'],
  }
}
