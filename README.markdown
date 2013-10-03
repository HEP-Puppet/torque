# torque #

This torque module is designed to install torque server, torque mom, munge and maui.
It expects that hiera is being used to pass site specific value. maui_cfg and munge_keys are served from site file server.
To enable files being served from say /etc/puppet/files, edit /etc/puppet/fileserver.conf

[site_files]
path /etc/puppet/files
allow *.my.domain

To install and configure torque server

  include torque::server
  
  It will include torque::server::config, torque::munge::config and torque::maui::config
  
  

To Install and configure torque mom
  
   include torque::mom
   
   It will include torque::mom::config and torque::munge::key

Be careful to get the master branch
 > git checkout master
