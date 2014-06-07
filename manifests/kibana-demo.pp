stage { pre: before => Stage[main] }
node 'kibana-demo' {
  exec { "apt-get-update":
    command => "/usr/bin/apt-get update",
  }

  package {'curl':
    provider => apt,
    ensure => latest,
    require => Exec['apt-get-update']
  }

  class { 'kibana':
	  webserver   => 'apache',
	  virtualhost => 'logs.example42.com', # Default: kibana.${::domain}
	}
}