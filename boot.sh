#!/bin/sh

cd /home/microblog/flask-app

. myenv/bin/activate

flask db stamp head
flask db migrate -m "installing the db code"
flask db upgrade
exec gunicorn -b :8000 --access-logfile - --error-logfile - microblog:app --daemon 
