# without gem install and alpline linux ui:2.4
FROM alpine:latest

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292
ENV APP_HOME /app

RUN apk update \ 
    && apk add ruby-full ruby-bundler ruby-dev g++ make --no-cache \
    && mkdir $APP_HOME

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME
CMD ["puma"]
