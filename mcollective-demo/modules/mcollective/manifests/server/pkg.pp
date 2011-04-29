class mcollective::server::pkg {

  include 'mcollective::pkg'

  package { 'mcollective':
    ensure    => $mcollective::params::pkg_state,
    require   => Class['mcollective::pkg::debian'],
    provider  => 'aptitude',
  }

}
