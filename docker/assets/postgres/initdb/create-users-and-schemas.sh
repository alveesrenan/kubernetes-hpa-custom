#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE USER kubernetes_hpa_custom WITH PASSWORD '123456' NOCREATEDB;

  CREATE DATABASE kubernetes_hpa_custom OWNER kubernetes_hpa_custom;
EOSQL
