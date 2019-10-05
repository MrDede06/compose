#!/bin/bash

psql -U postgres myproject < /docker-entrypoint-initdb.d/dbexport.pgsql


