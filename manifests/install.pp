# == Class gitlabmultirunner::install
#
# This class is called from gitlabmultirunner for install.
#
class gitlabmultirunner::install {
  case $::osfamily {
    'Debian': {
      include ::apt
      ensure_packages('apt-transport-https')
      apt::source { 'runner_gitlab-ci-multi-runner':
        location => 'https://packages.gitlab.com/runner/gitlab-ci-multi-runner/debian/',
        release  => $::lsbdistcodename,
        repos    => 'main',
        key      => {
          'id'     => '1A4C919DB987D435939638B914219A96E15E78F4',
          'source' => ' https://packages.gitlab.com/gpg.key',
        },
        include  => {
          'src' => true,
          'deb' => true,
        },
      }

      apt::pin { 'origin packages.gitlab.com':
        explanation => 'Prefer GitLab provided packages over the Debian native ones',
        priority    => 1001,
        packages    => [
          $::gitlabmultirunner::package_name,
        ],
      }
    }
    'RedHat': {
      ensure_packages( ['pygpgme', 'yum-utils'] )
      yumrepo {'runner_gitlab-ci-multi-runner':
        baseurl => "https://packages.gitlab.com/runner/gitlab-ci-multi-runner/el/${::operatingsystemmajrelease}/${::architecture}",
        enabled => 1,
        gpgkey  => 'https://packages.gitlab.com/runner/gitlab-ci-multi-runner/gpgkey',

      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  package { $::gitlabmultirunner::package_name:
    ensure => present,
  }
}
