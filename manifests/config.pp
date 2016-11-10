# == Class gitlabmultirunner::config
#
# This class is called from gitlabmultirunner for service config.
#
class gitlabmultirunner::config {
  file { '/etc/gitlab-runner/config.toml':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    require => Class['gitlabmultirunner::install'],
    notify  => Class['gitlabmultirunner::service'],
  }
  concat::fragment { 'header_/etc/gitlab-runner/config.toml':
    target  => '/etc/gitlab-runner/config.toml',
    content => template('gitlabmultirunner/header_config.toml.epp'),
    order   => '01',
  }
}
