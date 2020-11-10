#!/bin/sh

docker run --name postgres -e POSTGRES_USER=employee_usr -e POSTGRES_PASSWORD=emp@13%loyee^ -e POSTGRES_DATABASE=employee_db -d postgres

docker exec -it postgres psql -U employee_usr -f docker-entrypoint-initdb.d/postgres_commands.sql


cd /home/microblog/flask-app

. myenv/bin/activate
flask db init
flask db migrate -m "installing the db code"
flask db upgrade
exec gunicorn -b :5000 --access-logfile - --error-logfile - microblog:app
