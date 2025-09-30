# Base image with Node.js
FROM node:18-slim

# Install dependencies for Salesforce CLI
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    git \
    openssl \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install Salesforce CLI globally
RUN npm install --global @salesforce/cli

# Set working directory
WORKDIR /app

# Copy deployment scripts
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Copy Salesforce project files
COPY manifest /app/manifest/package.xml
COPY force-app /app/force-app
COPY sfdx-project.json /app/sfdx-project.json

# Entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
