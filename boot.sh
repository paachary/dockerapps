#!/bin/sh
export POSTGRES_URL="127.0.0.1:5432"
export POSTGRES_USER="employee_usr"
export POSTGRES_PW="emp@13%loyee^"
export POSTGRES_DB="employee_db"

cd /home/microblog/flask-app

source myenv/bin/activate
flask db upgrade
flask translate compile
exec gunicorn -b :5000 --access-logfile - --error-logfile - microblog:app
