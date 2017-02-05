FROM ubuntu:latest
MAINTAINER Tom Searcher

RUN apt-get update

#Server to wait for letsencrypt challenge
RUN apt-get -y install nginx

#Letsencrypt installation
RUN apt-get -y install letsencrypt

#cron and anacron installation. Anacron allows usage of ubuntu "daily" folder
RUN apt-get -y install cron
RUN apt-get -y install anacron

#default plus location .well-known, which is letsencrypt challenge response folder
ADD nginx_default /etc/nginx/sites-available/default

#add scripts to create renew certs and sync them with rancher
ADD rancher_letsencrypt /root/rancher_letsencrypt
ADD start_letsencrypt /root/start_letsencrypt
ADD daily_letsencrypt /etc/cron.daily/daily_letsencrypt

RUN chmod a+x /root/rancher_letsencrypt
RUN chmod a+x /root/start_letsencrypt
RUN chmod a+x /etc/cron.daily/daily_letsencrypt

# Run the command on container startup
CMD /root/start_letsencrypt && /bin/bash

