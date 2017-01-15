class { 'keepalived':
  service_manage => false,
}

keepalived::vrrp::instance { 'VI_50':
  interface => 'eth0',
  state => 'BACKUP',
  virtual_router_id => '50',
  priority => '100',
  auth_type => 'PASS',
  auth_pass => 'secret',
  virtual_ipaddress => [ '10.0.0.1/24' ],
  track_interface => [ 'eth0' ],
}
