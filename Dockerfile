FROM ubuntu:artful
RUN apt-get update && apt-get -y upgrade \
        && apt-get install -y python \
        && apt-get install -y python-pip \
        && apt-get install -y python-setuptools python-dev build-essential libssl-dev libffi-dev python-pip \
        && apt-get install -y net-tools \
        && apt-get install -y sudo \
        && apt-get install -y nginx \
        && apt-get install -y iputils-ping \
        && apt-get install -y net-tools \
        && apt-get install -y curl \
        && pip install --upgrade pip \
        && pip install requests \
        && apt-get install -y vim \
        && pip install requests_oauthlib \
        && pip install Flask-AutoIndex \
        && pip install flask gunicorn

RUN rm /etc/nginx/sites-enabled/default
COPY flask_settings /etc/nginx/sites-available/flask_settings
RUN ln -s /etc/nginx/sites-available/flask_settings /etc/nginx/sites-enabled/flask_settings
EXPOSE 80 443 5000 8000 8080

