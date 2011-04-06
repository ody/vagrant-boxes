class mcollective::server::pkg {

  class { 'mcollective::pkg':
    server => 'present',
  }

}
