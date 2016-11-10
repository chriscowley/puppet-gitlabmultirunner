# Class: gitlabmultirunner
# ===========================
#
# Full description of class gitlabmultirunner here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class gitlabmultirunner (
  $package_name = $::gitlabmultirunner::params::package_name,
  $service_name = $::gitlabmultirunner::params::service_name,
) inherits ::gitlabmultirunner::params {

  # validate parameters here

  class { '::gitlabmultirunner::install': } ->
  class { '::gitlabmultirunner::config': } ~>
  class { '::gitlabmultirunner::service': } ->
  Class['::gitlabmultirunner']
}
