#!/bin/sh

docker run --name postgres -e POSTGRES_USER=employee_usr -e POSTGRES_PASSWORD=emp@13%loyee^ -e POSTGRES_DATABASE=employee_db -d postgres

docker cp postgres_commands.sql postgres:docker-entrypoint-initdb.d/postgres_commands.sql

docker exec -it postgres psql -U employee_usr -f docker-entrypoint-initdb.d/postgres_commands.sql

docker run --name webapp -d -p 8000:5000 --rm --link postgres:dbserver -e POSTGRES_URL=dbserver -e POSTGRES_USER=employee_usr -e POSTGRES_DB=employee_db -e POSTGRES_PW=emp@13%loyee^ webapp:latest

