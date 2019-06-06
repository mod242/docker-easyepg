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
RUN apt-get install -y cron phantomjs dialog curl wget libxml2-utils perl perl-doc jq php php-curl git xml-twig-tools unzip liblocal-lib-perl cpanminus build-essential inetutils-ping
RUN cpan App:cpanminus
RUN cpanm install JSON
RUN cpanm install XML::Rules
RUN cpanm install Data::Dumper
RUN cpanm install Time::Piece
RUN cpanm install Time::Seconds
RUN cpanm install DateTime
RUN cpanm install DateTime::Format::DateParse
RUN cpanm install utf8
RUN cpanm XML::DOM
RUN mkdir -p /easyepg


# copy files
COPY root/ /

# ports and volumes
VOLUME /easyepg
