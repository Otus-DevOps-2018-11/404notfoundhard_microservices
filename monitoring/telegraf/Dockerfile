FROM alpine:latest
ADD telegraf /bin
ADD telegraf.conf /etc/telegraf/telegraf.conf
RUN apk add --no-cache libc6-compat
CMD ["/bin/telegraf"]