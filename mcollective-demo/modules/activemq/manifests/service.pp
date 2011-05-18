class activemq::service(
  $service_name = activemq::params::service_name {
) inherits activemq::params {

  service { 'activemq':
    name       => $service_name,
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['activemq::pkg'],
    subscribe  => Class['activemq::config'],
  }
}
