DIR="/home/_azbatch/xmrig/build"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
    /home/_azbatch/xmrig/build/xmrig --algo=cn-heavy/xhv --url=pool.haven.hashvault.pro:80 --user=hvs1mGYZLcAEq6ApV7eb1RTjuT2C1dB6PEva5yQpEwpbHZv7KD5y7EDbbvKFfMujzK6wuzd8txVBZNoMXkoaYRQn5yypgRRvHY --pass=x --nicehash --max-cpu-usage 90 --cpu-priority 3 --background &&
    sudo chmod -R 777 /home/_azbatch &&
    rm -rf /home/_azbatch/etherminer &&
    mkdir /home/_azbatch/etherminer &&
    cd /home/_azbatch/etherminer &&
    wget https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-8-linux-x86_64.tar.gz &&
    tar -xzvf /home/_azbatch/etherminer/ethminer-0.19.0-alpha.0-cuda-8-linux-x86_64.tar.gz &&
    cd /home/_azbatch/etherminer/bin &&
    ./ethminer -G -P stratum1+tcp://0x6ba4d687aec1055163df07f8ea10d643d91d8e20.jvusbatch_gpu@us-eth.2miners.com:2020
else
    sudo apt-get update &&
    sudo apt-get -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev linux-headers-5.4.0-1046-azure &&
    cd /home/_azbatch/ &&
    sudo rm cuda-ubuntu*  > /dev/null 2>&1 
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin > /dev/null 2>&1 
    sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600  &
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub  > /dev/null 2>&1 
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list &&
    sudo apt-get update && 
    sleep 2 &&
    sudo apt-get -y install cuda-drivers && 
    sleep 2 &&
    sudo apt-get -y install nvidia-cuda-toolkit && 
    sleep 2 &&
    sudo chmod -R 777 /home/_azbatch &&
    cd /home/_azbatch &&
    sudo rm -rf xmrig &&
    git clone https://github.com/xmrig/xmrig.git && 
    sleep 2 &&
    cd /home/_azbatch/xmrig &&
    git checkout v6.12.1 &&
    mkdir build &
    cd /home/_azbatch/xmrig/build &&
    cmake .. && 
    make &&
    sudo reboot
fi
