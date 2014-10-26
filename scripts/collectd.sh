#!/bin/sh
exec /sbin/setuser collectd /usr/sbin/collectd -C /etc/collectd/collectd.conf -f
