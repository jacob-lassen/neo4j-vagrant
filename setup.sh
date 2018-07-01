#!/bin/bash

sudo apt-get update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -    
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo docker run --detach --rm -e NEO4J_AUTH=none -p 17474:7474 -p 17373:7373 -p 17687:7687 neo4j
sudo apt-get -y install nginx

sudo echo \
"user www-data;
worker_processes 4;
pid /run/nginx.pid;

events {
    worker_connections  1024;
}


http {
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;

    server {
        listen 7474;

        location / {
            proxy_pass  http://127.0.0.1:17474/;
            include /etc/nginx/proxy_params;
        }
    }
    server {
        listen 7373;

        location / {
            proxy_pass  http://127.0.0.1:17373/;
            include /etc/nginx/proxy_params;
        }
    }
    server {
        listen 7687;

        location / {
            proxy_pass  http://127.0.0.1:17687/;
            include /etc/nginx/proxy_params;
        }
    }
}" | sudo tee /etc/nginx/nginx.conf

sudo nginx -s reload