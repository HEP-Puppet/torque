class torque::mom::config(
  $torque_server  = $torque::params::torque_server,
  $restricted     = $torque::params::mom_restricted,
  $ideal_load_adj = $torque::params::mom_ideal_load_adj,
  $max_load_adj   = $torque::params::mom_max_load_adj,
  $options        = $torque::params::mom_options,
  $usecp          = $torque::params::mom_use_cp,

) inherits torque::params {
  file { '/etc/torque/mom/config':
    ensure  => 'present',
    content => template("${module_name}/pbs_config.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['torque-mom'],
  }

  file { '/etc/torque/server_name':
    ensure  => 'present',
    content => template("${module_name}/server_name.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['torque-mom'],
  }
}
