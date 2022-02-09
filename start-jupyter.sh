#!/bin/bash

docker-compose up -d --build

# We need to parse token=<jupyter-token> after jupyter server has started
TOKEN="Currently"
next=true
pattern='^token=[a-z0-9]{48}'
while $next; do
  sleep 1 &
  TOKEN=$(docker exec -it jupyter-lab sh -c 'jupyter server list |tail -n1|cut -d " " -f 1|cut -d "?" -f 2')
  if [[ $TOKEN =~ $pattern ]]; then 
    next=false
  fi
  wait
done

# Build the URL for the host
URL="http://localhost:8888/?${TOKEN}"
echo "Trying to open jupyter lab with: "
echo $URL

# Try to open the jupyter lab in default browser:
open $URL