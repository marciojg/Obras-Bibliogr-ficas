FROM ruby:2.6.5

# ENV LANG=pt_BR.UTF-8
# Set the locale
RUN apt-get update && \
    apt-get install -y locales && \
    locale-gen pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR:pt
ENV LC_ALL pt_BR.UTF-8

# Ports.
EXPOSE 3000

# App.
RUN mkdir -p /app

WORKDIR /app

COPY . .

RUN bundle install

CMD rm -Rf /app/tmp/pids/ && bundle exec rails server -b 0.0.0.0 -p 3000
