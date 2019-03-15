FROM alpine:latest
ENV APP /app
RUN apk update && apk add ruby-full ruby-bundler ruby-dev g++ make --no-cache \
    && mkdir $APP \
    && apk add mongodb
WORKDIR $APP
COPY Gemfile* $APP/
RUN bundle install
COPY . $APP
CMD ["puma"]