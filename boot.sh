#!/bin/sh
cd /home/microblog/flask-app

source myenv/bin/activate
flask db init
flask db migrate -m "installing the db code"
flask db upgrade
exec gunicorn -b :5000 --access-logfile - --error-logfile - microblog:app
