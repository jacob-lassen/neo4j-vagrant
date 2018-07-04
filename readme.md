# Neo4j Vagrant
vagrant setup for running a neo4j database.

A virtaul manchine running [ubuntu 14](https://app.vagrantup.com/ubuntu/boxes/trusty64) will be set up running a [neo4j docker container](https://hub.docker.com/_/neo4j/).

port 7474, 7373 and 7687 will be forwarded to the container.

## How to run
simply run `vagrant up` and neo4j will be available on 7474, 7373 and 7687.

## Dependencies

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)
