class torque::server::nodesfile(
  $torque_server       =  $torque::params::torque_server_name,
  $nodesfile           =  $torque::params::nodesfile
) inherits torque::params {

#collect these
#  @@concat::fragment { "torque_node_${::clientcert}":
#      target => "$nodesfile",
#      content => "${::clientcert}",
#      tag => "$torque::params::torque_server"

 if ( str2bool($autonodesfile) ) {
 concat{"$nodesfile":
     owner => root,
     group => root,
     mode  => 644,
     notify => [ Service['pbs_server'], Service['maui'] ]
  }
    Concat::Fragment <<| tag == "nodesfile_${::clientcert}" |>>
 }
}
