FROM ruby:2.5

ADD ./ /app

WORKDIR /app

RUN bundle install

EXPOSE 9292

CMD ["./script/dev_entrypoint.sh"]
