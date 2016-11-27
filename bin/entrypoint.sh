#!/bin/sh

set -eo pipefail

if [ "$1" = "built-in" ]; then
  shift

  if [ "$1" = "cgi" ]; then
    exec su-exec nobody python -m http.server --cgi 8000
  else
    exec su-exec nobody python -m http.server 8000
  fi 

fi

exec "$@"