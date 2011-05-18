class vagrant {

  include vagrant::fixes
  case $operatingsystem {
    debian,ubuntu: {
      include vagrant::apt
    }
  }

}
