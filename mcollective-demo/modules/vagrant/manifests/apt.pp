class vagrant::apt {

  exec { 'apt_update':
    command => 'fail',
    unless  => 'aptitude update',
    path    => '/bin:/usr/bin:/sbin:/usr/sbin',
  }
}
