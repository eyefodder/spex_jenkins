# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
class spex_jenkins::trust_local_traffic{

  postgresql::server::pg_hba_rule{ 'trust_unix_all':
    type        => 'local',
    database    => 'all',
    user        => 'all',
    auth_method => 'trust',
    order       => '00001',
  }

  postgresql::server::pg_hba_rule{ 'trust_IPv4_all':
    type        => 'host',
    database    => 'all',
    user        => 'all',
    auth_method => 'trust',
    address     => '127.0.0.1/32',
    order       => '00002',
  }

  postgresql::server::pg_hba_rule{ 'trust_IPv6_all':
    type        => 'host',
    database    => 'all',
    user        => 'all',
    auth_method => 'trust',
    address     => '::1/128',
    order       => '00003',
  }
}
class spex_jenkins::create_db_role {
  class { 'postgresql::server':
    encoding => 'UTF8',
    locale   => 'en_US',
  }
  postgresql::server::role { 'vagrant': superuser => true,; 'jenkins': superuser => true;}
}


class spex_jenkins::postgres_setup{
  include spex_jenkins::trust_local_traffic
  include spex_jenkins::create_db_role
}
