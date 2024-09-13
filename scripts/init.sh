#!/bin/bash

set -x

server_hosts=(
"node-0"
"node-1"
"node-2"
"node-3"
"node-4"
)



init_session_name="init_tmux"

for server in "${server_hosts[@]}"
do
    server_host=${server}.fusee-cache-test.nsccgz-storage-pg0.apt.emulab.net
    ssh-keyscan ${server_host} >> ~/.ssh/known_hosts
    echo "server_host: $server_host"
done
