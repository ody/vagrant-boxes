class activemq {

    # Load the variables used in this module. Check the params.pp file 
    require activemq::params

    file { 'kumina_repo':
      ensure  => file,
      path    => '/etc/apt/sources.list.d/kumina_activemq.list',
      content => 'deb http://debian.kumina.nl/debian/ squeeze-kumina main',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      notify  => Exec['apt_update'],
    }

    # Basic Package - Service - Configuration file management
    package { "activemq":
        name     => "${activemq::params::packagename}",
        ensure   => present,
        provider => aptitude,
        require  => File['kumina_repo'],
    }

    service { "activemq":
        name       => "${activemq::params::servicename}",
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => "${activemq::params::hasstatus}",
        pattern    => "${activemq::params::processname}",
        require    => Package["activemq"],
        subscribe  => File["activemq.conf"],
    }

    file { "activemq.conf":
        path    => "${activemq::params::configfile}",
        mode    => "${activemq::params::configfile_mode}",
        owner   => "${activemq::params::configfile_owner}",
        group   => "${activemq::params::configfile_group}",
        ensure  => present,
        require => Package["activemq"],
        notify  => Service["activemq"],
        content => template("activemq/activemq.xml.erb"), # Single node activemq setup
    }

    # Include OS specific subclasses, if necessary
    case $operatingsystem {
        redhat,centos: { include activemq::redhat }
        default: { }
    }

}
