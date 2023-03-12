echo "Cloning Sorobix-Formatter"
git clone https://github.com/sorobix/sorobix-formatter
echo "Cloning Sorobix-API"
git clone https://github.com/sorobix/sorobix-api
echo "Entering formatter"
cd sorobix-formatter
echo "Fetching latest code"
git pull origin master
echo "Building sorobix-formatter"
docker build . -t sorobix-formatter
echo "Entering api"
cd ../sorobix-api
echo "Fetching latest code"
git pull origin main
echo "Building sorobix-api"
docker build . -t sorobix-api
cd ..
echo "Turning up the service"
docker-compose up --build --detach
echo "sorobix-backend up"
