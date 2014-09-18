# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
class spex_jenkins::configure_jenkins{

  include jenkins

  jenkins::plugin {
    "embeddable-build-status" : ;
  }
  jenkins::plugin {
    "git-client" : ;
  }
  jenkins::plugin {
    "git" : ;
  }
  jenkins::plugin {
    "github" : ;
  }
  jenkins::plugin {
    "github-api" : ;
  }
  jenkins::plugin {
    "ssh-agent" : ;
  }
  jenkins::plugin {
    "rake" : ;
  }
  jenkins::plugin {
    "rubyMetrics" : ;
  }
  jenkins::plugin {
    "rvm" : ;
  }
  jenkins::plugin {
    "scm-api" : ;
  }
  jenkins::plugin {
    "simple-theme-plugin" :
  }
  jenkins::plugin {
    "jquery" : ;
  }
  jenkins::plugin {
    "token-macro" : ;
  }
  file { '/var/lib/jenkins/org.codefirst.SimpleThemeDecorator.xml':
    ensure => file,
    source => 'puppet:///modules/spex_jenkins/org.codefirst.SimpleThemeDecorator.xml',
    group => jenkins,
    owner => jenkins,
    replace => no,
    require => Class["jenkins::package"],
  }
  file { '/var/lib/jenkins/config.xml':
    ensure => file,
    source => 'puppet:///modules/spex_jenkins/jenkins_config.xml',
    group => jenkins,
    owner => jenkins,
    replace => no,
    require => Class["jenkins::package"],
  }
}