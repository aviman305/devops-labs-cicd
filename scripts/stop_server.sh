#!/bin/bash
set -e

echo "Stopping Node.js application..."

# Kill any existing node processes
pkill -f "node app.js" || true
pkill -f "npm start" || true

# Wait a moment for graceful shutdown
sleep 2

echo "Application stopped"
