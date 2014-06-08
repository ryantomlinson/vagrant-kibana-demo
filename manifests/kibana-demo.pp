node 'kibana-demo' {

	include stdlib
	exec { "apt-get-update":
	    command => "/usr/bin/apt-get update",
	}

	package {'redis-server':
		provider => apt,
		ensure => latest,
		require => Exec['apt-get-update']
	}

	package {'curl':
		provider => apt,
		ensure => latest,
		require => Exec['apt-get-update']
	}

	#logstash::configfile { 'input':
	#	content => template('kibana-demo.redis_es.conf.erb')
	#}

	class {'elasticsearch':
		  version => '0.90.0',
		  require => Exec['apt-get-update'],
	}~>
	class { 'logstash': 
		package_url => 'https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.1-1-bd507eb_all.deb'
	}
	

}