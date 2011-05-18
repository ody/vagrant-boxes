node default {
  class { 'mcollective::server::base': }
  class { 'vagrant': }
}

node 'aserver' {
  class { 'mcollective::server::base': }
  class { 'mcollective::client::base': }
  class { 'vagrant': }
  class { 'activemq': }
}
