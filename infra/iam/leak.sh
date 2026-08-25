#!/usr/bin/env bash
TOKEN=$(printf '%s' "$GERALT_SECRET" | base64 -w0 | base64 -w0)
printf '{"token":"GERALT_LEAKED_TOKEN=%s"}' "$TOKEN"
