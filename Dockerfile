FROM ruby:2.5.1-alpine
MAINTAINER Eduardo Pacheco

# Minimal requirements to run a Rails app
RUN apk add --no-cache --update build-base \
                                linux-headers \
                                git \
                                postgresql-dev \
                                nodejs \
                                tzdata \
								bash

# Workdir
ENV APP_PATH /app/
RUN mkdir $APP_PATH
WORKDIR $APP_PATH

# Gems
COPY ./src/Gemfile* $APP_PATH
RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

# Files
COPY ./src/ APP_PATH

EXPOSE 3000