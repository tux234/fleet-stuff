#!/bin/bash
# Quick mobileconfig validation script
# Usage: ./validate-profile.sh <file.mobileconfig>

set -euo pipefail

FILE="${1:?Usage: validate-profile.sh <file.mobileconfig>}"
ERRORS=0

echo "Validating: $FILE"
echo "---"

# 1. Check plist validity
if ! plutil -lint "$FILE" > /dev/null 2>&1; then
  echo "FAIL: Invalid plist XML"
  plutil -lint "$FILE" 2>&1 || true
  ERRORS=$((ERRORS + 1))
fi

# 2. Check PayloadVersion exists
VERSION_COUNT=$(grep -c '<key>PayloadVersion</key>' "$FILE" || echo 0)
DICT_COUNT=$(grep -c '<dict>' "$FILE" || echo 0)
# Rough check: should have at least as many PayloadVersion as inner dicts
# (outer dict + each inner payload should have one)
if [ "$VERSION_COUNT" -lt 2 ]; then
  echo "WARN: Only $VERSION_COUNT PayloadVersion found — expected at least 2 (outer + inner)"
  ERRORS=$((ERRORS + 1))
fi

# 3. Check for bare UUID PayloadIdentifiers
if grep -A1 '<key>PayloadIdentifier</key>' "$FILE" | grep -E '<string>[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}</string>' > /dev/null 2>&1; then
  echo "FAIL: PayloadIdentifier uses bare UUID instead of reverse-DNS format"
  grep -B1 -A1 '<key>PayloadIdentifier</key>' "$FILE" | grep -E '<string>[0-9A-Fa-f]{8}-' || true
  ERRORS=$((ERRORS + 1))
fi

# 4. Check for <real> where <integer> expected (PayloadVersion)
if grep -A1 '<key>PayloadVersion</key>' "$FILE" | grep '<real>' > /dev/null 2>&1; then
  echo "FAIL: PayloadVersion uses <real> instead of <integer>"
  ERRORS=$((ERRORS + 1))
fi

# 5. Check for invalid hex in UUIDs
if grep -A1 '<key>PayloadUUID</key>' "$FILE" | grep -E '<string>[^<]*[G-Zg-z][^<]*</string>' > /dev/null 2>&1; then
  echo "FAIL: PayloadUUID contains non-hex characters"
  grep -A1 '<key>PayloadUUID</key>' "$FILE" | grep '<string>' || true
  ERRORS=$((ERRORS + 1))
fi

echo "---"
if [ "$ERRORS" -eq 0 ]; then
  echo "PASS: No issues found"
else
  echo "FOUND: $ERRORS issue(s)"
fi

exit "$ERRORS"
