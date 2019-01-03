#!/bin/bash

COMPUTER=$(cat /tmp/computer)

(
  flock -n 200 || exit 1

  source /etc/environment

  echo
  echo
  echo
  echo
  echo "****START****xxxx****"

  /usr/local/bin/Rscript /r/xxxx/src/RunProcess.R

  echo "****END****xxxx****"

) 200>/var/lock/.xxxx.exclusivelock
