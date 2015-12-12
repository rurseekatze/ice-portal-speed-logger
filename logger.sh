#!/bin/bash

while true
do
	TIME=$(date +"%s")
	curl -m 3 http://ice.portal2/jetty/api/v1/status >> $1
	echo "\n" >> $1
	sleep 4.5s
done
