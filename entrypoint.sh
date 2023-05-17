#!/usr/bin/env bash
export XDG_DATA_HOME=/gamedata

if [ ! -d "$XDG_DATA_HOME" ]; then
  echo "Creating $XDG_DATA_HOME as it does not exists"
  mkdir $XDG_DATA_HOME
fi

echo "Starting server at $(date)"
/server/bin/linux_x64/eurotrucks2_server
