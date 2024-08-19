#!bin/bash
echo "Starting docker containers..."
docker-compose up --build -d
echo "Docker containers started successfully"

sleep 5

echo "DockerUP"

docker exec -it mongodb1 ./scripts/mongo.sh