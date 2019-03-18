FROM alpine:latest
ADD blackbox_exporter /blackbox_exporter
ADD config.yml /etc/blackbox_exporter/config.yml
run apk add --no-cache libc6-compat
EXPOSE 9115
CMD ["/blackbox_exporter","--config.file=/etc/blackbox_exporter/config.yml"]
