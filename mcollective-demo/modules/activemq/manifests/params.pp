class activemq::params  {

  $stomp_user         = 'mcollective'
  $stomp_passwd       = 'marionette'
  $stomp_port         = '61613'
  $stomp_admin_user   = 'admin'
  $stomp_admin_passwd = 'admin'

  $amq_configfile = $operatingsystem ? {
      default => "/etc/activemq/activemq.xml",
  }

  $amq_configdir = $operatingsystem ? {
      default => "/etc/activemq",
  }

  $amq_init_configfile = $operatingsystem ? {
      /(?i-mx:ubuntu|debian)/ => '/etc/default/activemq',
      default                 => '/etc/sysconfig/activemq',
  }

  $amq_pidfile = $operatingsystem ? {
    default => '/var/run/activemq/activemq.pid',
  }

  $amq_datadir = $operatingsystem ? {
    default => '/var/lib/activemq',
  }

  $amq_logdir = $operatingsystem ? {
    default => '/var/log/activemq',
  }

  $pkg_provider = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/ => 'aptitude',
    default                 => undef,
  }
}
