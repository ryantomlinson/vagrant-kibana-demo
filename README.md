vagrant-kibana-demo
===================

Demonstration on Logging/Dashboarding with Kibana/Logstash/Elasticsearch

Running on Vagrant (default provider is vmware)
---
- git submodule init
- git submodule update
- vagrant up

Remaining manual instructions
---
- https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.zip
- unzip master.zip
- sudo cp -R ~/kibana-3.1.0 /usr/share/nginx/kibana
- /etc/nginx/sites/available/default
- sudo service nginx restart
- https://download.elasticsearch.org/logstash/logstash/logstash-1.4.1.tar.gz
- tar -xvzf logstash-1.4.1.tar.gz
- create confs
- start shipper and indexer

