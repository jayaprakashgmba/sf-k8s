FROM node:18-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget jq unzip git openssl \
    && rm -rf /var/lib/apt/lists/*

# Install Salesforce CLI
RUN npm install --global @salesforce/cli

WORKDIR /app

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Copy manifest folder
COPY manifest /app/manifest

# Copy server.key
COPY force-app /app/force-app
COPY sfdx-project.json /app/sfdx-project.json
COPY server.key /app/server.key

ENTRYPOINT ["/app/entrypoint.sh"]
