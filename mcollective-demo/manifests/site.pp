node default {
  class { 'vagrant': }
  class { 'mcollective::server::base': }
}

node 'aserver' {
  class { 'vagrant': }
  class { 'activemq::base': }
  class { 'mcollective::server::base': }
  class { 'mcollective::client::base': }
}
