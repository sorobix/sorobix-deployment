#!/bin/bash
echo "Cloning Sorobix-Wasm-Handler"
git clone https://github.com/sorobix/wasm-handler
echo "Cloning Sorobix-API"
git clone https://github.com/sorobix/sorobix-api-rs
echo "Entering wasm handler"
cd wasm-handler
echo "Fetching latest code"
git pull origin main
echo "Building wasm-handler"
docker build . -t wasm-handler:latest
echo "Entering api"
cd ../sorobix-api-rs
echo "Fetching latest code"
git pull origin master
echo "Building sorobix-api-rs"
docker build . -t sorobix-api-rs:latest
cd ..
echo "Turning up the service"
docker-compose up --build --detach
echo "sorobix-backend up"
