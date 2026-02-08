#!/bin/sh
set -e

echo "Starting n8n..."

# Install n8n locally
npm install n8n@latest

# Create data directory
mkdir -p /data

# Import workflow if present
if [ -f agent.json ]; then
  echo "Importing workflow..."
  npx n8n import:workflow --input=agent.json
fi

# Start n8n
exec npx n8n start --port=${PORT:-5678}
