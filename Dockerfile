FROM lsiobase/ubuntu:xenial

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="easyepg version:- 0.3.7"
LABEL maintainer="mod242"

# package versions
ARG EEPG_VER="0.3.7"

# environment variables.
ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME /easyepg
ENV EEPG_VER="0.3.7"

RUN apt-get update
RUN apt-get dist-upgrade -qy
RUN apt-get install -qy build-essential nano unzip cron iproute2 phantomjs dialog curl wget git libxml2-utils perl perl-doc jq php php-curl xml-twig-tools liblocal-lib-perl inetutils-ping cpanminus 
RUN cpan App:cpanminus
RUN cpanm install JSON
RUN cpanm install XML::Rules
RUN cpanm install XML::DOM
RUN cpanm install Data::Dumper
RUN cpanm install Time::Piece
RUN cpanm install Time::Seconds
RUN cpanm install DateTime
RUN cpanm install DateTime::Format::DateParse
RUN cpanm install utf8
RUN mkdir -p /easyepg
RUN apt-get remove --purge -qy build-essential
RUN apt-get -qy autoclean
RUN apt-get -qy clean
RUN apt-get -qy autoremove --purge
RUN rm -rf /tmp/* /var/tmp/* /var/log/* /var/lib/apt/lists/* /var/lib/{apt,dpkg,cache,log}/ /var/cache/apt/archives /usr/share/doc/ /usr/share/man/ /usr/share/locale/


# copy files
COPY root/ /

# ports and volumes
VOLUME /easyepg
