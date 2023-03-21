FROM ruby:3.2.1

RUN apt-get update -qq \
  && apt-get install -y nodejs postgresql-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR /myapp

ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="production" \
    BUNDLE_WITHOUT="development"

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /myapp/bin/rails
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3000
CMD ["./bin/rails", "server"]
