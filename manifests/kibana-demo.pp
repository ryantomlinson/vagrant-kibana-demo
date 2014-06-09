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

	package {'nginx':
		provider => apt,
		ensure => latest,
		require => Exec['apt-get-update']
	}

	package {'vim':
		provider => apt,
		ensure => latest,
		require => Exec['apt-get-update']
	}

	package {'zip':
		provider => apt,
		ensure => latest,
		require => Exec['apt-get-update']
	}

	package {'openjdk-7-jre-headless':
		provider => apt,
		ensure => latest,
		require => Exec['apt-get-update']
	}~>
	class {'elasticsearch':
		require => Exec['apt-get-update'],
		package_url => 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.deb',
		config => {
	    	'cluster' => {
	    		'name' => 'elasticsearch'
	    	}
   		}
	}~>
	class { 'logstash': 
		package_url => 'https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.1-1-bd507eb_all.deb'
	}~>
	class { 'kibana3':
		manage_ws => false,
	}
	#class { 'logstash': 
	#	package_url => 'https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.1-1-bd507eb_all.deb'
	#}

	#logstash::configfile { 'input':
	#	content => template('kibana-demo.redis_es.conf.erb')
	#}
}