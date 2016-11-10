# == Class gitlabmultirunner::params
#
# This class is meant to be called from gitlabmultirunner.
# It sets variables according to platform.
#
class gitlabmultirunner::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'gitlab-ci-multi-runner'
      $service_name = 'gitlab-runner'
    }
    'RedHat', 'Amazon': {
      $package_name = 'gitlab-ci-multi-runner'
      $service_name = 'gitlab-runner'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
