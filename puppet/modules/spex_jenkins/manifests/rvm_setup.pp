# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
class spex_jenkins::rvm_setup{
  include rvm
  # rvm::system_user { vagrant: ; jenkins: ; }
}
