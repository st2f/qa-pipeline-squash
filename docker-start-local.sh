#!/bin/bash
set -e

echo "🚀 Starting Laravel app stack..."
docker compose -f docker-compose.yml up -d

echo "🚀 Starting Squash TM stack..."
docker compose -f docker-compose-squash.yml up -d

echo "✅ Both stacks are up!"
