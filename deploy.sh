#!/bin/bash

# This script is used to deploy the application

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed. Please install Homebrew before running this script."
    exit 1
fi

# Install dependencies using Homebrew
echo "Installing dependencies..."
brew install nginx
brew install node
brew install mysql

# Check if MySQL is running
if brew services list | grep -q "mysql.*started"; then
    echo "Stopping MySQL service..."
    brew services stop mysql
fi

# Configure nginx
echo "Configuring nginx..."
sudo cp nginx.conf /usr/local/etc/nginx/nginx.conf
sudo nginx -s reload

# Deploy application
echo "Deploying application..."
git pull origin main
npm install
npm run build

echo "Deployment completed successfully."

