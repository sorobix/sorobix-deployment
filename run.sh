#!/bin/bash
echo "Cloning Sorobix-Formatter"
git clone https://github.com/sorobix/sorobix-formatter
echo "Cloning Sorobix-API"
git clone https://github.com/sorobix/sorobix-api-rs
echo "Entering formatter"
cd sorobix-formatter
echo "Fetching latest code"
git pull origin master
echo "Building sorobix-formatter"
docker build . -t sorobix-formatter:latest
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
