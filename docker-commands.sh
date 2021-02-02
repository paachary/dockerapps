#!/bin/sh


## Create a network which will be using the bridge type (default) so that we will run our containers in the same network 
## using the bridge

docker network create mynetwork

## Build the docker image
docker build -t webapp .

## Run the postgres container with the appropriate parameters in the network created locally.
docker run --network mynetwork --name postgres -e POSTGRES_USER=employee_usr -e POSTGRES_PASSWORD=emp@13%loyee^ -e POSTGRES_DB=employee_db -d postgres

## Run the webapp container in the same network.
## To reference the postgres containers, just invoke the postgres container name which is the host name
docker run --network mynetwork --name webapp -d -p 80:80 --rm -e POSTGRES_USER=employee_usr -e POSTGRES_PASSWORD=emp@13%loyee^ -e POSTGRES_DB=employee_db -e POSTGRES_URL=postgress_app:5432 -e POSTGRES_PW=emp@13%loyee^ webapp:latest

