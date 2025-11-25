#!/bin/bash

echo "⚠️  This will remove ALL Docker containers, images, volumes, and networks."
read -p "Are you sure? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
fi

# Stop and remove all containers
echo "Stopping and removing all containers..."
docker rm -f $(docker ps -a -q) 2>/dev/null || true

# Remove all images
echo "Removing all Docker images..."
docker rmi -f $(docker images -a -q) 2>/dev/null || true

# Remove all volumes
echo "Removing all Docker volumes..."
docker volume rm $(docker volume ls -q) 2>/dev/null || true

# Remove all non-default networks
echo "Removing all Docker networks except default ones..."
docker network rm $(docker network ls | grep "bridge\|host\|none" -v | awk '{ print $1 }') 2>/dev/null || true

# Clean up Docker build cache
echo "Cleaning up Docker build cache..."
docker builder prune -a -f

# Remove all unused Docker objects including volumes
echo "Running system prune to remove unused objects..."
docker system prune -a --volumes -f

echo "Docker cleanup completed."
