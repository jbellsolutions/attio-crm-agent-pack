#!/usr/bin/env bash
set -euo pipefail

site=https://gleaming-buddha-49nk.here.now
repo=https://github.com/jbellsolutions/attio-crm-agent-pack
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

curl -fsSL --retry 2 "$site/" -o "$tmp/index.html"
curl -fsSL --retry 2 "$site/attio-crm-agent.tar.gz" -o "$tmp/attio-crm-agent.tar.gz"
curl -fsSL --retry 2 "$site/attio-crm-agent.tar.gz.sha256" -o "$tmp/attio-crm-agent.tar.gz.sha256"
(cd "$tmp" && shasum -a 256 -c attio-crm-agent.tar.gz.sha256)
tar -tzf "$tmp/attio-crm-agent.tar.gz" > "$tmp/site-files.txt"

for path in HANDOFF.md CHARTER.md skills/attio-crm/SKILL.md references/mcp-tools.md; do
  grep -Fxq "$path" "$tmp/site-files.txt"
done

curl -fsSL --retry 2 "$repo/archive/refs/heads/main.tar.gz" -o "$tmp/github.tar.gz"
tar -tzf "$tmp/github.tar.gz" > "$tmp/github-files.txt"
grep -Eq '/skills/attio-crm/SKILL\.md$' "$tmp/github-files.txt"
mkdir "$tmp/site-pack" "$tmp/github-pack"
tar -xzf "$tmp/attio-crm-agent.tar.gz" -C "$tmp/site-pack"
tar -xzf "$tmp/github.tar.gz" --strip-components=1 -C "$tmp/github-pack"
diff -qr "$tmp/site-pack" "$tmp/github-pack"

if grep -Eq 'drv_li[A-Za-z0-9_-]+' "$tmp/index.html"; then
  echo 'Public page contains a Drive token' >&2
  exit 1
fi

echo 'Public page, checksum, and matching GitHub/direct archives verified without credentials.'
