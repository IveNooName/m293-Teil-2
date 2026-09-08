#!/usr/bin/env bash
set -euo pipefail

# Projekt-Root ermitteln, egal von wo aufgerufen
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

set -a
source .env
set +a

[ -f "$ROOT/src/index.html" ] || { echo "src/index.html fehlt – Projekt kaputt?"; exit 1; }

lftp -c "
set sftp:auto-confirm yes;
open -u $SFTP_USER,$SFTP_PASS sftp://$SFTP_HOST;
lcd $ROOT/src;
cd httpdocs;
mirror -R --delete --verbose \
  --exclude-glob .git/ \
  --exclude-glob .idea/ \
  --exclude-glob .git \
  --exclude-glob .idea \
  ./ ./
"