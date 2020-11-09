FROM ubuntu:latest
MAINTAINER BlogWebApp

FROM python:latest

RUN adduser -D microblog

WORKDIR /home/microblog

RUN apt update && apt install -y git 

RUN git clone https://github.com/paachary/flask-app.git

WORKDIR /home/microblog/flask-app

RUN python -v venv venv

RUN venv/bin/pip install -r requirements.txt

RUN chmod a+x boot.sh

ENV FLASK_APP microblog.py

RUN chown -R microblog:microblog ./

USER microblog

EXPOSE 5000

ENTRYPOINT ["./boot.sh"]
