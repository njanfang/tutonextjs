#!/bin/bash

 container_id=$(docker ps --filter "status=running" --format "{{.ID}}")

 if [ -n "$container_id" ]; then
 docker cp /var/lib/jenkins/workspace/tutonextjs/. "$container_id":/usr/share/nginx/html
 else
 docker build -t server1 /var/lib/jenkins/workspace/tutonextjs
 docker run -d -p 9190:81 server1
 fi
