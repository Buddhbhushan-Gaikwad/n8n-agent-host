#!/bin/sh
set -e

echo "Starting n8n..."

mkdir -p /data

# Import workflow
if [ -f agent.json ]; then
  echo "Importing workflow..."
  npx n8n import:workflow --input=agent.json
fi

# Start n8n
exec npx n8n start --port=${PORT:-5678} --host=0.0.0.0
