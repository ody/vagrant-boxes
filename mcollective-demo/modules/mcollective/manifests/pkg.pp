class mcollective::pkg(
  $server = 'absent',
  $client = 'absent'
) {

  Package { provider => 'aptitude' }

  file { 'ignore_keys':
    ensure  => file,
    path    => '/etc/apt/apt.conf.d/99untrusted',
    content => 'Aptitude::CmdLine::Ignore-Trust-Violations "true";',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    before  => File['mcollective_repo'],
    notify  => Exec['apt_update'],
  }

  file { 'mcollective_repo':
    ensure  => file,
    path    => '/etc/apt/sources.list.d/puppetlabs_ubuntu.list',
    content => 'deb http://apt.puppetlabs.com/ubuntu unstable main',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Exec['apt_update'],
  }

  exec { 'apt_update':
    command     => 'apt-get update',
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    refreshonly => true,
  }

  package { 'libstomp-ruby':
    ensure    => present,
    require   => Exec['apt_update'],
  }

  package { 'mcollective':
    ensure    => $server,
    require   => Exec['apt_update'],
  }

  package { 'mcollective-client':
    ensure    => $client,
    require   => Exec['apt_update'],
  }
}
