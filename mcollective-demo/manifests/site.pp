node default {
  class { 'mcollective::server::base': }
  class { 'vagrant': }
  class { 'vagrant::fixes': }
}

node 'aserver' {
  class { 'mcollective::server::base': }
  class { 'mcollective::client::base': }
  class { 'vagrant': }
  class { 'vagrant::fixes': }
}
