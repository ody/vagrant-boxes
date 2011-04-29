class mcollective::client::pkg {

  include 'mcollective::pkg'

  package { 'mcollective-client':
    ensure   => $mcollective::params::pkg_state,
    require  => Class['mcollective::pkg::debian'],
    provider => 'aptitude',
  }

}
