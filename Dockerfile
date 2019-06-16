FROM ruby:latest
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn
RUN mkdir /app
WORKDIR /app
COPY . .
RUN bundle install
RUN bundle exec rails db:drop
RUN bundle exec rails db:create
RUN bundle exec rails db:migrate
EXPOSE 3001
CMD ["bash","-c","rm -f tmp/pids/server.pid && bundle exec rails s -p 3001 -b '0.0.0.0'"]
