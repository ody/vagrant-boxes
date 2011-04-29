class mcollective::client::base {
  class { 'mcollective::client::config': }
  class { 'mcollective::client::pkg': }
}
