#!/bin/bash
set -e

echo "🛑 Stopping Laravel app stack..."
docker compose -f docker-compose.yml down

echo "🛑 Stopping Squash TM stack..."
docker compose -f docker-compose-squash.yml down

echo "✅ Both stacks are stopped!"
