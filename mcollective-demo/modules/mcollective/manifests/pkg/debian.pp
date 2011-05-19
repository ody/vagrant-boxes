class mcollective::pkg::debian(
  $pkg_provider = undef,
  $pkg_state    = 'present'
) {

  package { 'libstomp-ruby':
    ensure    => $pkg_state,
    provider  => $pkg_provider,
  }
}
