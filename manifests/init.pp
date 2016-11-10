# Class: gitlabmultirunner
# ===========================
#
# Full description of class gitlabmultirunner here.
#
# Parameters
# ----------
#
# * `gitlaburl`
#   URL of Gitlab host
#
# * `gitlabtoken`
#   Token to use when register with gitlab
#
class gitlabmultirunner (
  $package_name = $::gitlabmultirunner::params::package_name,
  $service_name = $::gitlabmultirunner::params::service_name,
  $gitlaburl    = $::gitlabmultirunner::params::gitlaburl,
  $gitlabtoken  = $::gitlabmultirunner::params::gitlabtoken,
) inherits ::gitlabmultirunner::params {

  # validate parameters here

  class { '::gitlabmultirunner::install': } ->
  class { '::gitlabmultirunner::config': } ~>
  class { '::gitlabmultirunner::service': } ->
  Class['::gitlabmultirunner']
}
