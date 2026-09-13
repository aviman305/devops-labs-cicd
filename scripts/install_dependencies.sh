#!/bin/bash
set -e

echo "Installing dependencies..."

# Update system packages
yum update -y

# Node.js and npm are typically pre-installed on Elastic Beanstalk
# But we ensure they're available
if ! command -v node &> /dev/null
then
    echo "Installing Node.js..."
    curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
    yum install -y nodejs
fi

# Install application dependencies
cd /var/app/current

echo "Installing npm packages..."
npm install --production

echo "Dependencies installed successfully"
