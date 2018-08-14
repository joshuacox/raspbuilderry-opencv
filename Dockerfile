FROM joshuacox/pi-cross-compile:latest
MAINTAINER Josh Cox <josh 'at' webhosting.coop>
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN apt-get -qq update; \
apt-get -qqy dist-upgrade ; \
apt-get -qqy --no-install-recommends install locales \
git sudo procps ca-certificates wget pwgen uucp; \
echo 'en_US.ISO-8859-15 ISO-8859-15'>>/etc/locale.gen ; \
echo 'en_US ISO-8859-1'>>/etc/locale.gen ; \
echo 'en_US.UTF-8 UTF-8'>>/etc/locale.gen ; \
locale-gen ; \
apt-get -y autoremove ; \
apt-get clean ; \
rm -Rf /var/lib/apt/lists/*

COPY opencv.sh /tmp/opencv.sh

RUN apt-get -qq update; \
bash /tmp/opencv.sh; \
apt-get -y autoremove ; \
apt-get clean ; \
rm -Rf /var/lib/apt/lists/*
