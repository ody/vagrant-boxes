class vagrant::fixes {

  host { $hostname:
    ensure => present,
    ip => '127.0.1.1',
    host_aliases => "${hostname}.vagrant.internal",
  }

}
