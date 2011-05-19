class activemq inherits activemq::params {

  package { "activemq":
    ensure   => present,
    provider => $pkg_provider,
  }
}
