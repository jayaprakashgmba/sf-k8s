FROM node:18-bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates curl unzip bash \
    && rm -rf /var/lib/apt/lists/*

# Install Salesforce CLI
RUN npm install -g @salesforce/cli@latest

WORKDIR /app

# Default entrypoint to sf
ENTRYPOINT ["sf"]

