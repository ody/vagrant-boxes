class mcollective(
  $stomp_server  = $mcollective::params::stomp_server,
  $stomp_ip      = $mcollective::params::stomp_ip,
  $stomp_aliases = $mcollective::params::stomp_aliases
) inherits mcollective::params {

  host { $stomp_server:
    ensure       => present,
    ip           => $stomp_ip,
    host_aliases => $stomp_aliases,
  }
}
