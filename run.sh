#!/bin/bash

if [ -z "$REDIS_NODE" ]
then
  echo "Missing REDIS_NODE env var"
  exit -1
fi

set -eo pipefail

function config_fail()
{
	echo "Failed to start due to config error"
	exit -1
}

n=0
until confd -onetime -backend redis -node $REDIS_NODE $CLIENT_KEY; do
  if [ "$n" -eq "4" ];  then config_fail; fi
  echo "Reload haproxy.cfg"
  n=$((n+1))
  sleep $n
done

echo "Starting confd ..."

confd -backend redis -node $REDIS_NODE $CLIENT_KEY