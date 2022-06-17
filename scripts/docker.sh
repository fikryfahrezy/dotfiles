#!/bin/bash

echo "Run docker/install.sh"

sudo groupadd docker
sudo usermod -aG docker $USER

newgrp docker

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

sudo mkdir -p "$HOME/Docker/mongo/data/db"
sudo mkdir -p "$HOME/Docker/mysql/mysql"
sudo mkdir -p "$HOME/Docker/postgresql/data"

docker run hello-world

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

docker network create mongo_net
docker network create mysql_net
docker network create postgre_net

PGADMIN_VER="6.4"
MONGO_VER="5.0.6"
MYSQL_VER="8.0.28"
PHPMYADMIN_VER="5.1.2"
POSTGRE_VER="14.1"
REDIS_VER="7.0.0"

docker pull dpage/pgadmin4:$PGADMIN_VER
docker pull mongo:$MONGO_VER
docker pull mysql:$MYSQL_VER
docker pull phpmyadmin/phpmyadmin:$PHPMYADMIN_VER
docker pull postgres:$POSTGRE_VER
docker pull redis:$REDIS_VER

docker run --name some-mysql -v "$HOME/Docker/mysql/mysql":/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root --network="mysql_net" -p 3306:3306 --restart=unless-stopped -d mysql:$MYSQL_VER --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
docker run --name phpmyadmin --link some-mysql:db --network="mysql_net" -p 3307:80 -d phpmyadmin/phpmyadmin:$PHPMYADMIN_VER

docker run --name some-postgre -e PGDATA=/var/lib/postgresql/data/pgdata -v "$HOME/Docker/postgresql/data":/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres --network="postgre_net" -p 5432:5432 --restart=unless-stopped -d postgres:$POSTGRE_VER
docker run --name pgadmin -e "PGADMIN_DEFAULT_EMAIL=postgre@postgre.com" -e "PGADMIN_DEFAULT_PASSWORD=postgre" --network="postgre_net" -p 5431:80 -d dpage/pgadmin4:$PGADMIN_VER

docker run --name some-mongo -v "$HOME/Docker/mongo/data/db":/data/db -e MONGO_INITDB_ROOT_USERNAME=mongo -e MONGO_INITDB_ROOT_PASSWORD=mongo --network="mongo_net" -p 27017:27017 --restart=unless-stopped -d mongo:$MONGO_VER

docker run --name some-redis -v "$HOME/Docker/redis/data":/data --network="redis_net" -p 6379:6379 -d redis:$REDIS_VER redis-server --save 60 1 --loglevel warning

echo "Done running docker/install.sh"
