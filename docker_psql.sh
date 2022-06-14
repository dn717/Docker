#use centos user
su centos

#start docker if docker server is not running
#what is `||` logic OR operator
sudo systemctl status docker || sudo systemctl start docker

#get latest postgres image
#Computer analogy, this cmd downloads a psql CD
docker pull postgres

#create a new volume if not exist
#analogy: buy a harddrive
docker volume create pgdata

#psql docker docs https://hub.docker.com/_/postgres
#set password for default user `postgres`
export PGPASSWORD='password' #set environment variable

#create a container using psql image with name=jrvs-psql
#analogy: install psql CD to a computer with name=jrvs-psql
docker run --name jrvs-psql -e POSTGRES_PASSWORD=$PGPASSWORD -d -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres:9.6-alpine

#check if the container `jrvs-psql` is created or not
#check if the computer `jrvs-psql` is installed or not
docker container ls -a -f name=jrvs-psql

#check if `jrvs-psql` container is running
#analogy: check `jrvs-psql` is powered on
docker ps -f name=jrvs-psql

#start/stop a container
#analogy: shutdown and turn on `jrvs-psql` computer
docker container stop jrvs-psql
docker container start jrvs-psql

#remove container (this doesn't remove your image)
#destroy the computer (you still have your CD and harddrive)
docker container rm jrvs-psql