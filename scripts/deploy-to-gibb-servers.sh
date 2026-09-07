#!/usr/bin/env bash
set -euo pipefail

# Projekt-Root ermitteln, egal von wo aufgerufen
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

set -a
source .env
set +a

npm run build

# Sicherheitscheck: existiert der Build überhaupt?
[ -f "$ROOT/dist/index.html" ] || { echo "dist/index.html fehlt – Build kaputt?"; exit 1; }

lftp -c "
set sftp:auto-confirm yes;
open -u $SFTP_USER,$SFTP_PASS sftp://$SFTP_HOST;
lcd $ROOT/dist;
cd httpdocs;
mirror -R --delete --verbose \
  ./ ./
"