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
    server_host=Chilton@${server}.fusee-cache-test.nsccgz-storage-PG0.apt.emulab.net
    #server_host=${server}.fusee-cache-test.nsccgz-storage-pg0.apt.emulab.net
    ssh-keyscan ${server_host} >> ~/.ssh/known_hosts
    echo "server_host: $server_host"
    ssh -o StrictHostKeychecking=no $server_host /bin/bash << EOF
set -x
hostname;
tmux kill-session -t ${init_session_name};
tmux new-session -d -s ${init_session_name};
tmux send-keys -t ${init_session_name} "git clone https://github.com/OhhhhPi/FUSEE.git" C-m;
tmux send-keys -t ${init_session_name} "cd FUSEE" C-m;
tmux send-keys -t ${init_session_name} "bash setup/setup-env.sh" C-m;
tmux send-keys -t ${init_session_name} "sudo /etc/init.d/openibd restart" C-m;
tmux send-keys -t ${init_session_name} "sudo apt install numactl libibverbs-dev librdmacm-dev libtbb-dev libboost-all-dev" C-m;
tmux send-keys -t ${init_session_name} "sudo bash -c "echo 7168 > /proc/sys/vm/nr_hugepages"" C-m;
tmux send-keys -t ${init_session_name} "cd ~/FUSEE" C-m;
tmux send-keys -t ${init_session_name} "mkdir build" C-m;
tmux send-keys -t ${init_session_name} "cd build" C-m;
tmux send-keys -t ${init_session_name} "cmake .." C-m;
tmux send-keys -t ${init_session_name} "make -j8" C-m;

EOF
done