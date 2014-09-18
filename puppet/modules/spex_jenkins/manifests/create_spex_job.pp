# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
class spex_jenkins::create_spex_job{
  file { '/var/lib/jenkins/jobs/Spex':
    ensure => directory,
    source => 'puppet:///modules/spex_jenkins/jenkins_jobs/Spex',
    recurse => remote,
    replace => no,
    group => jenkins,
    owner => jenkins,
    require => Class["jenkins::package"],
  }

  # exec { "wget http://localhost:8080/jnlpJars/jenkins-cli.jar -r -O /home/vagrant/jenkins-cli.jar":
  #   creates => '/home/vagrant/jenkins-cli.jar',
  #   alias => 'jenkins-cli',
  # }


  # file {'/home/vagrant/spex_config.xml':
  #   source => 'puppet:///modules/spex_jenkins/spex_config.xml',
  #   alias => 'spex_job_config'
  # }
  # # exec {
  # #   'curl -X POST "http://localhost:8080/createItem?name=spex" --data-binary "@spex_config.xml" -H "Content-Type: text/xml"  >/dev/null 2>&1' :
  # #       subscribe => File['spex_job_config'] ,
  # #       cwd => '/home/vagrant',
  # #       require => [ Class["spex_jenkins::configure_jenkins"], Class["spex_jenkins::base_packages"]]
  # # }
  #   exec {
  #   'java -jar jenkins-cli.jar -s http://localhost:8080/ create-job Spex < spex_config.xml' :
  #       subscribe => [ File['spex_job_config'] , Exec['jenkins-cli'] ],
  #       cwd => '/home/vagrant',
  # }
}