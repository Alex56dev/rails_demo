#!/bin/bash
set -e

rm -f /myapp/tmp/pids/server.pid

bundle install

rails db:migrate

exec "$@"