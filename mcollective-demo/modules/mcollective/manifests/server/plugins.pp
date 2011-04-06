class mcollective::server::plugins {

  file { 'mcollective_plugins':
    ensure  => directory,
    path    => '/usr/share/mcollective/plugins/mcollective',
    source  => 'puppet:///modules/mcollective/usr/share/mcollective/plugins/mcollective',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    recurse => true,
    notify  => Class['mcollective::server::service'],
    require => Class['mcollective::server::pkg'],
  }

}
