#!/bin/bash
if [ -z "$DOCKER_VERSION" ]; then
    echo '[FATAL] DOCKER_VERSION is undefined'
    exit 1
fi

echo "---------------------------"
echo "Install Docker EE Engine (install-docker.sh)"
echo "---------------------------"
echo "[INFO] installing Docker engine version $DOCKER_VERSION"

sudo apt-get install -y \
  apt-transport-https \
  curl \
  software-properties-common

curl -fsSL https://storebits.docker.com/ee/linux/sub-5f42c74a-4bae-48e3-b56b-8b7fb06a5d91/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://storebits.docker.com/ee/linux/sub-5f42c74a-4bae-48e3-b56b-8b7fb06a5d91/ubuntu \
   $(lsb_release -cs) \
   stable-17.06"

sudo apt-get update
sudo apt-get install -y docker-ee

echo "---------------------------"
echo "Install Docker EE Engine Complete"
echo "---------------------------"