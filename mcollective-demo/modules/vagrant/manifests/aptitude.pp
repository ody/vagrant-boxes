class vagrant::aptitude {

  exec { 'aptitude_update':
    command     => 'aptitude update',
    refreshonly => true,
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
  }

  file { 'kumina_repo':
    ensure  => file,
    path    => '/etc/apt/sources.list.d/kumina_repo.list',
    content => 'deb http://debian.kumina.nl/debian/ squeeze-kumina main',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Exec['aptitude_update'],
  }

  file { 'mcollective_repo':
    ensure  => file,
    path    => '/etc/apt/sources.list.d/mcollective_repo.list',
    content => 'deb http://apt.puppetlabs.com/ubuntu unstable main',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Exec['aptitude_update'],
  }

  file { 'ignore_trust_violations':
    ensure  => file,
    path    => '/etc/apt/apt.conf.d/99untrusted',
    content => 'Aptitude::CmdLine::Ignore-Trust-Violations "true";',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    before  => File['mcollective_repo', 'kumina_repo'],
    notify  => Exec['aptitude_update'],
  }
}
