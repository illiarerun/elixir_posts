# ./Dockerfile

# Extend from the official Elixir image.
FROM elixir:latest

# M1 Workaraound
ENV ERL_FLAGS="+JPperf true"

RUN apt-get update && \
  apt-get install -y postgresql-client && \
  apt-get install -y inotify-tools

RUN mkdir /APP_HOME
WORKDIR $APP_HOME

RUN mix local.hex --force && \
  mix archive.install hex phx_new --force && \
  mix local.rebar --force

COPY mix.exs .
COPY mix.lock .

RUN ["mix", "deps.get"]
RUN ["mix", "deps.compile"]

COPY config ./config
COPY lib ./lib
COPY priv ./priv
COPY test ./test

RUN ["mix", "compile"]

COPY ./entrypoint.sh ./entrypoint.sh
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]