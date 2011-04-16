define mcollective::plugins::plugin(
  $type,
  $ensure      = present,
  $ddl         = false,
  $application = false,
  $plugin_base = $mcollective::params::plugin_base
) inherits mcollective::params {

  if ($ddl == true or $application == true) and $type != 'agent' {
    fail('DDLs and Applications only apply to Agent plugins')
  }

  file { "${plugin_base}/${type}/${name}.rb":
    ensure => $ensure,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/mcollective/plugins/${type}/${name}/${name}.rb",
  }

  if $ddl {
    file { "${plugin_base}/${type}/${name}.ddl":
      ensure => $ensure,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => "puppet:///modules/mcollective/plugins/${type}/${name}/${name}.ddl",
    }
  }

  if $application {
    file { "${plugin_base}/application/${name}.rb":
      ensure => $ensure,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => "puppet:///modules/mcollective/plugins/${type}/${name}/application/${name}.rb",
    }
  }

}
