class vagrant {

  stage { 'pre': }
  Stage['pre'] -> Stage['main'] 

  include vagrant::fixes

  case $operatingsystem {
    debian,ubuntu: {
      class { 'vagrant::aptitude':
        stage => 'pre',
      }
    }
    redhat,centos,fedora: {
      class { 'vagrant::yum':
        stage => 'pre'
      }
    }
  }
}
