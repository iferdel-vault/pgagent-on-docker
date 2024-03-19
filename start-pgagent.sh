#!/bin/bash
set -e

# Starting PostgreSQL
docker-entrypoint.sh postgres &

# Waiting for PostgreSQL to start
until pg_isready; do
  sleep 1;
done

# Starting pgAgent
pgagent hostaddr=localhost dbname=course user=postgres -s pgagent_log.log

# Keep the container running
wait

