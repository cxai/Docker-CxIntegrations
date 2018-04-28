#!/bin/bash

for entry in /services/*.sh
do
  if [[ -f "$entry" ]]; then
    echo "$entry"
    [[ ! -x "$entry" ]] && (chmod +x "$entry"; sync)
    "$entry"
  fi
done

exec '/run-server.sh'
