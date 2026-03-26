# Learnings & Known Issues

Observations from real-world Fleet mobileconfig validation. Update this file as new patterns emerge.

## Issue #1: Missing PayloadVersion (MOST COMMON)

**Frequency**: ~80+ files in Fleet repo
**Pattern**: Inner payload dicts missing `<key>PayloadVersion</key><integer>1</integer>`
**Root cause**: Template used for CIS benchmark test profiles omitted PayloadVersion
**Fix**: Always include `PayloadVersion` in every dict — outer AND inner
**Affected areas**: `ee/cis/macos-13/test/profiles/`, `ee/cis/macos-14/test/profiles/`, `it-and-security/lib/`

## Issue #2: Bare UUID as PayloadIdentifier

**Frequency**: ~6 files
**Pattern**: `<string>7404609C-9F8B-45CF-B5CC-9ADD7962EA72</string>` used as PayloadIdentifier
**Root cause**: Copy-pasting PayloadUUID into PayloadIdentifier field
**Fix**: Use reverse-DNS format: `com.fleetdm.profiles.<name>.<uuid>`
**Affected areas**: `docs/solutions/`, `it-and-security/lib/`

## Issue #3: Invalid UUID hex characters

**Frequency**: 1 file
**Pattern**: `B2C3D4E5-F6G7-8901-2345-678901BCDEFG` — contains 'G' which is not hex
**File**: `docs/solutions/macos/configuration-profiles/crowdstrike-service-management.mobileconfig`
**Fix**: Regenerate with `uuidgen`

## Issue #4: Float instead of integer for PayloadVersion

**Frequency**: 2 files
**Pattern**: `<real>1.0</real>` instead of `<integer>1</integer>`
**Root cause**: Profile editor or hand-editing used wrong plist type
**Fix**: Always use `<integer>1</integer>`

## Issue #5: Unknown/Typo PayloadType

**Frequency**: 2 occurrences
**Patterns**:
- `com.apple.mdmclient` → should be `com.apple.mdm`
- `com.apple.mcx.alr` → should be `com.apple.MCX`
**File**: `tools/mdm/apple/turn_on_debug_mdm_logging.mobileconfig`

## Issue #6: Invalid plist XML

**Frequency**: 3 files
**Pattern**: `ExpectedEndOfEventStream` or `InvalidDataString` parse errors
**Root cause**: Placeholder text or template markers left in file, malformed XML
**Affected areas**: `testdata/` directories

## Issue #7: Missing required fields in test profiles

**Frequency**: 1 file
**Pattern**: Missing PayloadType, PayloadIdentifier, PayloadUUID on inner payload
**File**: `server/service/testdata/profiles/custom-profile-validation.mobileconfig`
**Note**: Test profiles should still be structurally valid unless intentionally testing validation

---

## Prevention Checklist

When generating profiles, always verify:
1. `PayloadVersion` on EVERY dict (outer + inner)
2. `PayloadIdentifier` in reverse-DNS format on EVERY dict
3. `PayloadUUID` is valid hex UUID on EVERY dict
4. `PayloadType` is a known domain
5. XML is well-formed (`plutil -lint`)
6. No duplicate UUIDs within a profile
