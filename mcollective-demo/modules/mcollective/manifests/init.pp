class mcollective(
  $stomp_server  = $mcollective::params::stomp_server,
  $stomp_aliases = $mcollective::params::stomp_aliases
) inherits mcollective::params {

  host { 'stomp':
    ip           => $stomp_server,
    ensure       => present,
    host_aliases => $stomp_aliases,
    before       => Class['mcollective::pkg']
  }

}
