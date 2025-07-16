#!/bin/bash
echo "$CREDENTIALS_JSON" > /etc/cloudflared/credentials.json
exec cloudflared tunnel --config /etc/cloudflared/config.yml run
