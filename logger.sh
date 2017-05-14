#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: ${0} output.json" >&2
	exit 1
fi

while true
do
	TIME=$(date +"%s")
	curl -m 3 https://portal.imice.de/api1/rs/status >> $1
	echo >> $1
	sleep 4.5s
done
