#!/bin/bash
set -e

echo "Starting Node.js application..."

# Change to application directory
cd /var/app/current

# Start the application with PM2 or node
# Option 1: Using node directly
npm start &

# Or Option 2: Using PM2 for production (uncomment if PM2 is installed)
# npm install -g pm2
# pm2 start app.js --name "creative-website"
# pm2 save
# pm2 startup

echo "Application started successfully"

# Give it a moment to start
sleep 5

# Verify it's running
curl http://localhost:8081/health || true
