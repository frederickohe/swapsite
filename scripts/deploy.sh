#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/var/www/swapsite"

cd "$REPO_DIR"
git fetch origin main
git reset --hard origin/main

# Static files are bind-mounted into Caddy; restart to pick up changes reliably.
cd /var/www/swapprocaddy
docker compose restart caddy

echo "swapsite deploy complete"
