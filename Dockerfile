FROM phusion/baseimage:0.9.14
MAINTAINER Chuck Sakoda <chuck.sakoda@us.imshealth.com>

RUN apt-get update 
RUN apt-get install -y collectd python-pip && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
RUN pip install envtpl
RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 25826:25826/udp 

ENV HOME /root
CMD ["/sbin/my_init"]

RUN adduser --system --group --no-create-home collectd
RUN chown collectd.collectd /var/lib/collectd
ADD conf/write_graphite.conf.tpl /etc/collectd/collectd.conf.d/write_graphite.conf.tpl
ADD conf/network.conf /etc/collectd/collectd.conf.d/network.conf
ADD conf/collectd.conf /etc/collectd/collectd.conf

ADD scripts/01-collectd_conf.sh /etc/my_init.d/
RUN mkdir /etc/service/collectd
ADD scripts/collectd.sh /etc/service/collectd/run 

