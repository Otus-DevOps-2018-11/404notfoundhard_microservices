FROM alpine:latest
ENV MONGODB_URL mongodb://post_db:27017
RUN mkdir app
WORKDIR /app
COPY mongodb_exporter .
CMD ["/app/mongodb_exporter"]
