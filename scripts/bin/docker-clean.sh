#!/bin/bash

# Stop and remove all containers
echo "Stopping and removing all containers..."
docker rm -f $(docker ps -a -q)

# Remove all images
echo "Removing all Docker images..."
docker rmi -f $(docker images -a -q)

# Remove all volumes
# echo "Removing all Docker volumes..."
# docker volume rm $(docker volume ls -q)

# Remove all non-default networks
echo "Removing all Docker networks except default ones..."
docker network rm $(docker network ls | grep "bridge\|host\|none" -v | awk '{ print $1 }')

# Clean up Docker build cache
echo "Cleaning up Docker build cache..."
docker builder prune -a -f

# Remove all unused Docker objects including volumes
echo "Running system prune to remove unused objects..."
docker system prune -a --volumes -f

echo "Docker cleanup completed."
