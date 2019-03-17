FROM        quay.io/prometheus/busybox:latest
MAINTAINER  The Prometheus Authors <prometheus-developers@googlegroups.com>

COPY blackbox_exporter  /bin/blackbox_exporter
COPY config.yml         /etc/blackbox_exporter/config.yml
RUN chmod 755 /bin/blackbox_exporter 

EXPOSE      9115
ENTRYPOINT  [ "/bin/blackbox_exporter" ]
CMD         [ "--config.file=/etc/blackbox_exporter/config.yml" ]
