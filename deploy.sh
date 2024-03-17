#!/bin/bash

# Install nginx
brew install nginx
brew install node
brew install mysql

# Stop MySQL service
brew services stop mysql

# Configure nginx
sudo cp nginx.conf /usr/local/etc/nginx/nginx.conf
sudo nginx -s reload

# Deploy application
git pull origin main
npm install
npm run build

