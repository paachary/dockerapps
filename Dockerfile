FROM ubuntu:latest

MAINTAINER BlogWebApp

FROM python:latest

FROM postgres:latest

RUN adduser --home /home/microblog --shell /bin/bash microblog

WORKDIR /home/microblog

RUN apt update && apt install -y git libpq-dev 

RUN git clone https://github.com/paachary/flask-app.git

WORKDIR /home/microblog/flask-app

RUN pip install virtualenv

RUN . myenv/bin/activate

RUN pip install -r requirements.txt

ENV FLASK_APP microblog.py

RUN chown -R microblog:microblog ./

USER microblog

EXPOSE 5000

WORKDIR /home/microblog

COPY postgres_commands.sql ./

COPY boot.sh ./

RUN chmod a+x boot.sh

ENTRYPOINT ["./boot.sh"]
