# Use a small Node base so sfdx (npm) works
FROM node:18-bullseye-slim

# Install utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates curl unzip bash \
  && rm -rf /var/lib/apt/lists/*

# Install Salesforce CLI (npm package)
RUN npm install -g @salesforce/cli@latest

# Create app user
RUN useradd --create-home appuser
WORKDIR /home/appuser
USER appuser

# copy entrypoint and make executable
COPY entrypoint.sh /home/appuser/entrypoint.sh
RUN chmod +x /home/appuser/entrypoint.sh

ENTRYPOINT ["/home/appuser/entrypoint.sh"]
