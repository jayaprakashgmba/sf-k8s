#!/bin/bash
set -e

echo "Starting Salesforce deployment..."

# Read env vars (from Kubernetes Secret/ConfigMap)
SF_USERNAME=${SF_USERNAME}
SF_CLIENT_ID=${SF_CLIENT_ID}
SF_SERVER_KEY_PATH=${SF_SERVER_KEY_PATH:-/certs/server.key}
SF_ALIAS=${SF_ALIAS:-Sandbox}
SF_TEST_LEVEL=${SF_TEST_LEVEL:-RunLocalTests}
TEST_CLASSES=${TEST_CLASSES}

# Authenticate via JWT
sf org login jwt \
  --username "$SF_USERNAME" \
  --client-id "$SF_CLIENT_ID" \
  --jwt-key-file "$SF_SERVER_KEY_PATH" \
  --alias "$SF_ALIAS" \
  --instance-url https://test.salesforce.com

# Deploy package
sf project deploy start \
  --manifest ./manifest/package.xml \
  --target-org "$SF_ALIAS" \
  --test-level "$SF_TEST_LEVEL" \
  ${TEST_CLASSES:+--tests "$TEST_CLASSES"} \
  --wait 10 \
  --verbose

echo "Deployment finished!"
