# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
Exec {
  path => "/usr/bin:/usr/local/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/vagrant_ruby/bin"
}
include rvm
class{ 'rvm::rvmrc':
  max_time_flag => 20,
  rvm_install_on_use_flag => 1,
  rvm_gemset_create_on_use_flag => 1,
  rvm_project_rvmrc => 1,
  before  => Class['rvm'],
}