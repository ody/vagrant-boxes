class mcollective::pkg::debian(
  $pkg_provider = undef,
  $pkg_state    = 'present'
) {

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

  package { 'libstomp-ruby':
    ensure    => $pkg_state,
    provider  => $pkg_provider,
    require   => Exec['apt_update'],
  }
}
