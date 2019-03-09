FROM ruby:2.5

ADD ./ /app

WORKDIR /app

RUN bundle install

CMD ["./script/dev_entrypoint.sh"]
