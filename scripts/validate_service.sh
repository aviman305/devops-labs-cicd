#!/bin/bash
set -e

echo "Validating service..."

# Wait for the application to be ready
sleep 3

# Check if the application is responding to health check
HEALTH_CHECK=$(curl -s http://localhost:8081/health || echo "failed")

if echo "$HEALTH_CHECK" | grep -q "OK"; then
    echo "Service validation passed"
    exit 0
else
    echo "Service validation failed"
    exit 1
fi
