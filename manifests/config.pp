# == Class gitlabmultirunner::config
#
# This class is called from gitlabmultirunner for service config.
#
class gitlabmultirunner::config {
  file { '/etc/gitlab-runner/config.toml':
    ensure => present,
  }
}
