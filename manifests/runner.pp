# Class gitlabmultirunner::runner
#
# Create runners in Gitlab config file
#
# [*url*]
#   Gitlab CI URL 
#   Defaults to http//gitlab.example.com/ci
#     - TODO: Not being set needs to throw an error
#
# [*token*]
#   Gitlab CI token
#   Defaults to undefined
#     - TODO: Not being set needs to throw an error
#
# [*executor*]
#   What to use to execute the jobs
#   Defaults to use Docker
#     - TODO: Currently only supports Docker, and only default params


define gitlabmultirunner::runner (
  $url      = 'http://gitlab.example.com/ci',
  $token    = undef,
  $executor = 'docker',
){
  concat::fragment { "${name}_/etc/gitlab-runner/config.toml":
    target  => '/etc/gitlab-runner/config.toml',
    content => template('gitlabmultirunner/runner_config.toml.epp', {
      'name'  => $name,
      'url'   => $url,
      'token' => $token,
    }),
  }
}
