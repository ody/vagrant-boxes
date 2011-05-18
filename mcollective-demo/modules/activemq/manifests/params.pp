class activemq::params  {

	$stomp_user 	= 'mcollective'
	$stomp_password = 'marionette'
    $admin_user 	= 'admin'
    $admin_password = 'admin'
    $packagename 	= 'activemq' 
    $servicename 	= 'activemq'
    $processname 	= 'activemq'
    $protocol 		= 'tcp'
    $stomp_port 	= '61613'
	$stomp_ip		= '192.168.56.10'
	$stomp_host		= 'aserver.vagrant.internal'

    $hasstatus = $operatingsystem ? {
        debian  => false,
        ubuntu  => false,
        default => true,
    }

    $configfile = $operatingsystem ? {
        default => "/etc/activemq/activemq.xml",
    }

    $configfile_mode = $operatingsystem ? {
        default => "644",
    }

    $configfile_owner = $operatingsystem ? {
        default => "root",
    }

    $configfile_group = $operatingsystem ? {
        default => "root",
    }

    $configdir = $operatingsystem ? {
        default => "/etc/activemq",
    }

    $initconfigfile = $operatingsystem ? {
        debian  => "/etc/default/activemq",
        ubuntu  => "/etc/default/activemq",
        default => "/etc/sysconfig/activemq",
    }
    
    $pidfile = $operatingsystem ? {
        default => "/var/run/activemq/activemq.pid",
    }

    $datadir = $operatingsystem ? {
        default => "/var/log/activemq/activemq-data/",
    }

    $logdir = $operatingsystem ? {
        default => "/var/log/activemq/",
    }

    


## FILE SERVING SOURCE
# Sets the correct source for static files
# In order to provide files from different sources without modifying the module
# you can override the default source path setting the variable $base_source
# Ex: $base_source="puppet://ip.of.fileserver" or $base_source="puppet://$servername/myprojectmodule"
# What follows automatically manages the new source standard (with /modules/) from 0.25 

    case $base_source {
        '': {
            $general_base_source = $puppetversion ? {
                /(^0.25)/ => "puppet:///modules",
                /(^0.)/   => "puppet://$servername",
                default   => "puppet:///modules",
            }
        }
        default: { $general_base_source=$base_source }
    }

}
