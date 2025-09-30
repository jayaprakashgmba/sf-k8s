#!/bin/bash
set -e

echo "Starting Salesforce deployment inside container..."

# Debug: show env vars
echo "SF_USERNAME=$SF_USERNAME"
echo "SF_CLIENT_ID=$SF_CLIENT_ID"
echo "SF_ALIAS=$SF_ALIAS"
echo "SF_LOGIN_URL=$SF_LOGIN_URL"
ls -l /certs/server.key

# JWT login
sf org login jwt \
  --username "$SF_USERNAME" \
  --client-id "$SF_CLIENT_ID" \
  --jwt-key-file /certs/server.key \
  --alias "$SF_ALIAS" \
  --instance-url "$SF_LOGIN_URL"

# Deploy using package.xml
sf project deploy start \
  --manifest /app/manifest/package.xml \
  --target-org "$SF_ALIAS" \
  --test-level "$SF_TEST_LEVEL" \
  --tests "$TEST_CLASSES" \
  --wait 10 \
  --verbose

echo "Salesforce deployment finished!"
