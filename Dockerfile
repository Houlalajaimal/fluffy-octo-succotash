FROM armbuild/ubuntu:latest
MAINTAINER noads@volfoni.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get install -y python2.7 python-pip

RUN pip install radicale && useradd -d /home/radicale -m radicale && mkdir -p /data/radicale && mkdir -p /home/radicale/.config && ln -s /data/radicale /home/radicale/.config/radicale && chown -R radicale /data/radicale && chown -R radicale /home/radicale/.config

EXPOSE 5232

VOLUME ["/data/radicale"]

ENV HOME /home/radicale
USER radicale
WORKDIR /home/radicale
CMD ["radicale"]
