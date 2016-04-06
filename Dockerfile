FROM haproxy:1.6.4

MAINTAINER Tomas Bartkus<to.bartkus@gmail.com>

RUN apt-get update &&  apt-get install curl -y

ADD haproxy/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

ADD bin/confd /bin/confd
RUN	chmod +x /bin/confd

ADD run.sh /run.sh
ADD run.sh /run.sh
RUN	chmod +x /run.sh
ADD confd /etc/confd

ENTRYPOINT ["/run.sh"]

EXPOSE 8080