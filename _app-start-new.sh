#!/usr/bin/env bash

cd `dirname $0`

echo "prepare rails ..."
bundle install
bundle exec rake rails:update:bin

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:test:prepare

echo "execute rspec ..."
bundle exec rspec
