#!/bin/bash

docker build -t local/ojs:"ojs-3_0_1-0" .

sed -i "s!pkpofficial/ojs:!local/ojs:!g" \
       "docker-compose.yml"
