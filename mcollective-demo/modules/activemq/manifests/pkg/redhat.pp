class activemq::pkg;:redhat {

  package { 'java-1.6.0-openjdk':
    ensure => present,
    before => Package['activemq'],
  }
}
