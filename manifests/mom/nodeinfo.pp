class torque::mom::nodeinfo ( $nodesfile = $torque::params::nodesfile,
      $staticnodeoptions = $torque::params::staticnodeoptions,
      $torque_server = $torque::params::torque_server,
      $memperjob = $torque::params::memperjob,
      $autonodesfile = $torque::params::autonodesfile     )  inherits torque::params
{
 if ( str2bool($autonodesfile) ){

  if $::processor0 =~ /^.*X5650.*$/ {
    $opts = "$staticnodeoptions"
  }
  else {
    $opts = "$staticnodeoptions FASTUNMAP"

  }
 
  $np =inline_template ("<%= @memorysize_mb.to_i / @memperjob.to_i %>")

  @@concat::fragment { "torque_node_${::clientcert}":
      target => "$nodesfile",
      content => "${::clientcert} np=${np} ${opts}\n",
      tag => "nodesfile_${torque_server}",
      order => 3
  }
 }
}
