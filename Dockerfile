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
RUN apt-get install -y cron phantomjs dialog curl wget libxml2-utils perl perl-doc jq php git xml-twig-tools unzip liblocal-lib-perl cpanminus build-essential inetutils-ping
RUN cpan App:cpanminus
RUN cpanm install JSON
RUN cpanm install XML::Rules
RUN cpanm install Data::Dumper
RUN cpanm install Time::Piece
RUN cpanm install Time::Seconds
RUN cpanm install DateTime
RUN cpanm install DateTime::Format::DateParse
RUN cpanm install utf8
RUN mkdir -p /easyepg
#RUN wget -O /tmp/easyepg.zip https://github.com/sunsettrack4/easyepg/archive/v${EEPG_VER}.zip
#RUN unzip /tmp/easyepg.zip -d /tmp
#RUN mv /tmp/easyepg-${EEPG_VER}/* /easyepg/
#RUN chmod -R 777 /easyepg
#RUN rm -R /tmp/*

# copy files
COPY root/ /

# ports and volumes
VOLUME /easyepg
