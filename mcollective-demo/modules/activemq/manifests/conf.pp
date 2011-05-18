define activemq::conf ($value) {

    require activemq::params

    config { "activemq_conf_$name":
        file      => "${activemq::params::configfile}",
        line      => "$name = $value",
        pattern   => "^$name ",
        engine    => "replaceline",
        notify    => Service["activemq"],
        require   => File["activemq.conf"],
    }

}
