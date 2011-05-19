class vagrant::yum {

  package { 'java-1.6.0-openjdk':
    ensure => present,
  }
}
