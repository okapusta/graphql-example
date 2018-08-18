#!/bin/bash

function __wait_for_db {
  sleep 15
  printf "Waiting for database to start\n"
  while ! ping -c 1 -n -w 1 database &> /dev/null
  do
      sleep 1

      printf "Waiting for database to start\n"
  done
}

function __bootstrap_database {
  printf "Migrating database...\n"

  bundle exec rake db:migrate
}

function __seed_database {
  printf "Seeding database...'n'"

  bundle exec rake db:seed
}

__wait_for_db
__bootstrap_database
__seed_database

bundle exec rerun 'rackup -o 0.0.0.0'
