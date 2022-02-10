#!/bin/bash
set -e

envsubst < /tmd/scripts/script.sql > /tmd/scripts/script-updated.sql

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f /tmd/scripts/script-updated.sql

rm -f /tmd/scripts/script-updated.sql
