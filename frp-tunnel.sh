#!/bin/bash
# Usage: ./frp-tunnel.sh dev1 3000
SUB=$1; PORT=$2
SERVER=157.230.255.83; TOKEN=77da14c0381ee5ab3b17de3fb4d064bad6f9eb7a04e1bae55ff0b9719fbc8217
BIN=frpc
DIR=".frp-bin"

mkdir -p $DIR && cd $DIR
if [ ! -f frpc ]; then
  echo "Downloading frpc (Linux x64)..."
  wget -q https://github.com/fatedier/frp/releases/download/v0.62.1/frp_0.62.1_linux_amd64.tar.gz
  tar -xzf *.tar.gz --strip-components=1 frp_0.62.1_linux_amd64/frpc
  chmod +x frpc
  rm *.tar.gz
fi
cat > frpc.ini <<EOF
[common]
server_addr = $SERVER
server_port = 7000
token = $TOKEN

[$SUB]
type = http
local_port = $PORT
subdomain = $SUB
EOF
./frpc -c frpc.ini
