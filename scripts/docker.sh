#!/bin/bash

echo "Run docker/install.sh"

sudo groupadd docker
sudo usermod -aG docker $USER

newgrp docker

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

sudo mkdir -p "$HOME/Docker/mongo/data/db"
sudo mkdir -p "$HOME/Docker/mysql/conf.d"
sudo mkdir -p "$HOME/Docker/mysql/mysql"
sudo mkdir -p "$HOME/Docker/postgresql/data"

docker run hello-world

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

docker network create mongo_net
docker network create mysql_net
docker network create postgre_net

docker pull dpage/pgadmin4:5
docker pull mongo:4.2
docker pull mysql:8.0
docker pull phpmyadmin/phpmyadmin:5.1.1
docker pull postgres:13.4

docker run --name some-mysql -v "$HOME/Docker/mysql/mysql":/var/lib/mysql -v "$HOME/Docker/mysql/conf.d":/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=root --network="mysql_net" -p 3306:3306 --restart=unless-stopped -d mysql:8.0 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
docker run --name some-postgre -e PGDATA=/var/lib/postgresql/data/pgdata -v "$HOME/Docker/postgresql/data":/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres --network="postgre_net" -p 5432:5432 --restart=unless-stopped -d postgres:13.4
docker run --name some-mongo -v "$HOME/Docker/mongo/data/db":/data/db -e MONGO_INITDB_ROOT_USERNAME=mongo -e MONGO_INITDB_ROOT_PASSWORD=mongo --network="mongo_net" -p 27017:27017 --restart=unless-stopped -d mongo:4.2
docker run --name phpmyadmin --link some_mysql:db --network="mysql_net" -p 3307:80 -d phpmyadmin/phpmyadmin:5.1.1
docker run --name pgadmin -e "PGADMIN_DEFAULT_EMAIL=postgre@postgre.com" -e "PGADMIN_DEFAULT_PASSWORD=postgre" --network="postgre_net" -p 5431:80  -d dpage/pgadmin4:5

echo "Done running docker/install.sh"
