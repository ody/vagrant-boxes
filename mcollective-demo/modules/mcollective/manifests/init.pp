class mcollective {

  host { 'stomp':
    ip           => '192.168.56.1',
    ensure       => present,
    host_aliases => 'stomp.vagrant.internal',
    before       => Class['mcollective::pkg']
  }

}
