#!/usr/bin/env bash
# Create the canonical Customer.io GitHub repo and push this tree to it.
# Requires: gh authenticated to an account that can create repos on the customerio org.
set -euo pipefail

REPO="customerio/cursor-plugin"
DESCRIPTION="Official Customer.io plugin for the Cursor Marketplace — MCP connector plus skills."
HOMEPAGE="https://customer.io"

if ! command -v gh >/dev/null 2>&1; then
  echo "Install GitHub CLI (gh), then run: gh auth login" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "GitHub CLI is not authenticated. Run: gh auth login" >&2
  exit 1
fi

if gh repo view "$REPO" >/dev/null 2>&1; then
  echo "Repo $REPO already exists. Adding git remote 'github' if missing."
else
  gh repo create "$REPO" \
    --private \
    --description "$DESCRIPTION" \
    --homepage "$HOMEPAGE" \
    --disable-wiki
  echo "Created https://github.com/$REPO (private). Make it public before Cursor Marketplace submit."
fi

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

if git remote get-url github >/dev/null 2>&1; then
  git remote set-url github "https://github.com/${REPO}.git"
else
  git remote add github "https://github.com/${REPO}.git"
fi

git push -u github HEAD:main
echo "Pushed to https://github.com/$REPO"
