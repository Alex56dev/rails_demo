FROM ruby:2.7.2

# install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
# install YARN
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

RUN useradd -m app
USER app

WORKDIR /app

COPY --chown=app:app Gemfile Gemfile.lock /app/
RUN bundle install

COPY --chown=app:app . /app

EXPOSE 3000

RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
