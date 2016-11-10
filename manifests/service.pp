# == Class gitlabmultirunner::service
#
# This class is meant to be called from gitlabmultirunner.
# It ensure the service is running.
#
class gitlabmultirunner::service {

  service { $::gitlabmultirunner::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
