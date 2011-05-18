class mcollective::params {

  $mc_topicprefix = '/topic/'
  $mc_main_collective = 'mcollective'
  $mc_collectives = ''
  $mc_libdir = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/        => '/usr/share/mcollective/plugins',
    /(?i-mx:centos|fedora|redhat)/ => '/usr/libexec/mcollective',
  }
  $mc_logfile = '/var/log/mcollective.log'
  $mc_loglevel = 'log'
  $mc_daemonize = '1'

  $plugin_base = "${mc_libdir}/mcollective"

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

  $stomp_user    = 'mcollective'
  $stomp_passwd  = 'marionette'
  $stomp_server  = 'stomp'
  $stomp_ip      = '192.168.56.10'
  $stomp_aliases = [
    'stomp.vagrant.internal',
    'aserver.vagrant.internal',
    'aserver',
  ]
  $stomp_port   = '61613'

  $pkg_provider = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/ => 'aptitude',
    default                 => undef,
  }

  $pkg_state = 'present'
}
