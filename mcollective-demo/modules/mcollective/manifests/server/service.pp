class mcollective::server::service {

  service { 'mcollective':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    start      => 'RUBYLIB=/usr/src/facter/lib:/usr/src/puppet/lib:$RUBYLIB /etc/init.d/mcollective start',
    restart    => 'RUBYLIB=/usr/src/facter/lib:/usr/src/puppet/lib:$RUBYLIB /etc/init.d/mcollective restart',
    require    => Class['mcollective::pkg'],
  }

}