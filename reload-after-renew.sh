#!/usr/bin/env bash
# filepath: ./scripts/reload-after-renew.sh

set -euo pipefail

echo "[*] Validating nginx config..."
docker exec nginx nginx -t

echo "[*] Reloading nginx..."
docker exec nginx nginx -s reload

echo "[*] Nginx reloaded after certificate renewal."
