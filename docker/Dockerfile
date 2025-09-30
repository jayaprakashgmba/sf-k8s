# Base image with Node.js
FROM node:18-slim

# Install dependencies for Salesforce CLI
RUN apt-get update && apt-get install -y \
    wget \
    jq \
    unzip \
    git \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Install Salesforce CLI (sf)
RUN npm install --global @salesforce/cli

# Set working directory
WORKDIR /app

# Copy deployment script
COPY deploy.sh /app/deploy.sh
RUN chmod +x /app/deploy.sh

# Default entrypoint
ENTRYPOINT ["/app/deploy.sh"]
