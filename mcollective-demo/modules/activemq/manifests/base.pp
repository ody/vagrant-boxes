class activemq::base {
  class { 'activemq': }
  class { 'activemq::pkg': }
  class { 'activemq::config': }
  class { 'activemq::service': }
}
