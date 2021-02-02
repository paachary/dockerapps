FROM ubuntu:latest

MAINTAINER BlogWebApp

FROM python:latest

RUN adduser --home /home/microblog --shell /bin/bash microblog

WORKDIR /home/microblog

RUN apt update && apt install -y git libpq-dev python3-pip

RUN git clone https://github.com/paachary/flask-app.git

WORKDIR /home/microblog/flask-app

RUN pip3 install virtualenv

RUN virtualenv myenv

RUN . myenv/bin/activate

RUN pip3 install -r requirements.txt

ENV FLASK_APP microblog.py

RUN chown -R microblog:microblog ./

WORKDIR /home/microblog

COPY boot.sh ./

RUN chmod +x boot.sh

USER microblog

EXPOSE 80

ENTRYPOINT ["./boot.sh"]
