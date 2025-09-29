#!/usr/bin/env bash
set -euo pipefail

# Print env for debugging (won't show secrets)
echo "Starting container. SF_ALIAS=${SF_ALIAS:-<none>}"

# Fail early if key not found
if [ ! -f "${JWT_KEY_FILE:-/certs/server.key}" ]; then
  echo "ERROR: JWT key file not found at ${JWT_KEY_FILE:-/certs/server.key}"
  exit 2
fi

# Run the sfdx deploy command
sf project deploy start \
  --target-org "${SF_ALIAS:-sepsandbox}" \
  --jwt-key-file "${JWT_KEY_FILE:-/certs/server.key}" \
  --client-id "${SF_CLIENT_ID}" \
  --test-level "${SF_TEST_LEVEL:-RunLocalTests}" \
  --json
