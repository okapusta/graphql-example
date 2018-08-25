#!/bin/bash

function __wait_for_db {
  printf "Waiting for database to start\n"

  sleep 10
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

function __bundle_gems {
  bundle install
}

function __seed_database {
  printf "Seeding database...\n"

  bundle exec rake db:seed
}

__wait_for_db
__bundle_gems
__bootstrap_database
__seed_database

bundle exec rerun -b 'rackup -o 0.0.0.0'
