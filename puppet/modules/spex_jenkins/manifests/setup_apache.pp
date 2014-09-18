# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
class spex_jenkins::setup_apache{
  class { 'apache': }
  apache::vhost { 'ci.spex.com':
    port    => '80',
    proxy_pass => { 'path' => '/', 'url' => 'http://localhost:8080/'},
    docroot => '/var/lib/jenkins/jobs',
    default_vhost => true,
  }
}

