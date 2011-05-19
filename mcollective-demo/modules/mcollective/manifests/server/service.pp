class mcollective::server::service {

  service { 'mcollective':
    ensure     => running,
    enable     => false,
    hasstatus  => true,
    start      => 'RUBYLIB=/usr/src/facter/lib:/usr/src/puppet/lib:$RUBYLIB /etc/init.d/mcollective start',
    stop       => 'RUBYLIB=/usr/src/facter/lib:/usr/src/puppet/lib:$RUBYLIB /etc/init.d/mcollective stop',
    require    => Class['mcollective::pkg'],
    subscribe  => Class['mcollective'],
  }

}
