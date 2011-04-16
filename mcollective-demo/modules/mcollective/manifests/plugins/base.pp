class mcollective::plugins::base(
  $plugin_base = $mcollective::params::plugin_base,
  $plugin_subs = $mcollective::params::plugin_subs
) inherits mcollective::params {

  file { $plugin_base:
    ensure  => directory,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Class['mcollective::server::pkg'],
  }

  file { $plugin_subs:
    ensure => directory,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    notify => Class['mcollective::server::service'],
  }

}
