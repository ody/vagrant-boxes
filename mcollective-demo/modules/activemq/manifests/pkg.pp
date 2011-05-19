class activemq::pkg(
  $pkg_provider = $activemq::params::pkg_provider
) inherits activemq::params {

  package { "activemq":
    ensure   => present,
    provider => $pkg_provider,
  }
}
