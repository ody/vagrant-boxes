class mcollective::params {

  $plugin_base = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/        => '/usr/share/mcollective/plugins/mcollective',
    /(?i-mx:centos|fedora|redhat)/ => '/usr/libexec/mcollective/mcollective',
  }

  $plugin_subs = [
    "${plugin_base}/agent",
    "${plugin_base}/application",
    "${plugin_base}/audit",
    "${plugin_base}/connector",
    "${plugin_base}/facts",
    "${plugin_base}/registration",
    "${plugin_base}/security",
    "${plugin_base}/util",
  ]

  $stomp_server  = '192.168.56.10'
  $stomp_aliases = [
    'stomp.vagrant.internal',
    'aserver.vagrant.internal',
    'aserver',
  ]

}
