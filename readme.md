# Neo4j Vagrant
vagrant setup for running a neo4j database.

A virtaul manchine running [ubuntu 14](https://app.vagrantup.com/ubuntu/boxes/trusty64) will be set up running a [neo4j docker container](https://hub.docker.com/_/neo4j/).

The port forwarding will be setup as
* 17474 -> 7474
* 17373 -> 7373
* 17687 -> 17687

## How to run
simply run `vagrant up` and neo4j will be available on 17474, 17373 and 17687.

## Dependencies

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)
