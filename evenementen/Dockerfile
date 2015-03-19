FROM rails:latest

MAINTAINER Florian Dejonckheere <florian@floriandejonckheere.be>

RUN mkdir /app

ENV RAILS_ENV development

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install

ADD . /app
WORKDIR /app

# Assume filled database is default
RUN rake db:create
RUN rake db:schema:load
RUN rake db:seed

EXPOSE 3000

CMD ["./start.sh"]
