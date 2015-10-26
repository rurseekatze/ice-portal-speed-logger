#!/bin/bash

while true
do
	TIME=$(date +"%s")
	curl http://ice.portal2/jetty/api/v1/status >> $1
	echo "\n" >> $1
	sleep 1s
done
