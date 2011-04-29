class mcollective::pkg(
  $pkg_provider = $mcollective::params::pkg_provider,
  $pkg_state    = $mcollective::params::pkg_state
) inherits mcollective::params {

  case $operatingsystem {
    debian,ubuntu: {
      class { 'mcollective::pkg::debian':
        pkg_provider => $pkg_provider,
        pkg_state    => $pkg_state,
      }
    }
    centos,redhat,fedora: {
      class { 'mcollective::pkg::redhat':
        pkg_provider => $pkg_provider,
        pkg_state    => $pkg_state,
      }
    }
  }
}
