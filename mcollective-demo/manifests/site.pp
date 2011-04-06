node default {
  class { 'mcollective': }
  class { 'mcollective::server::pkg': }
  class { 'mcollective::server::service': }
  class { 'mcollective::server::config': }
  class { 'mcollective::server::plugins': }
  class { 'vagrant': }
  class { 'vagrant::fixes': }
}
