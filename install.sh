cd chat_server
./build.sh
cd ..

cd game_server
./build.sh
cd ..

docker compose up -d
