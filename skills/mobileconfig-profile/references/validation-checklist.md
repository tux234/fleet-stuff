# Mobileconfig Validation Checklist

Run through this for every `.mobileconfig` before delivering.

## Structure

- [ ] XML declaration present: `<?xml version="1.0" encoding="UTF-8"?>`
- [ ] DOCTYPE present: `<!DOCTYPE plist PUBLIC ...>`
- [ ] Outer dict has `PayloadType` = `Configuration`
- [ ] Outer dict has `PayloadVersion` = `<integer>1</integer>`
- [ ] Outer dict has `PayloadContent` array with at least one inner dict

## PayloadIdentifier (every dict)

- [ ] Outer: reverse-DNS format (e.g., `com.fleetdm.profiles.my-profile`)
- [ ] Inner: reverse-DNS format (e.g., `com.fleetdm.profiles.my-profile.<uuid>`)
- [ ] **No bare UUIDs** as identifiers (e.g., `7404609C-...` is WRONG)

## PayloadUUID (every dict)

- [ ] Valid RFC 4122 format: `XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`
- [ ] Only hex characters: `[0-9A-F]` (no G, H, etc.)
- [ ] Every UUID in the profile is **unique** (no duplicates)

## PayloadVersion (every dict)

- [ ] Present on **outer** profile dict
- [ ] Present on **every inner** payload dict
- [ ] Uses `<integer>1</integer>` — never `<real>1.0</real>`

## PayloadType (inner dicts)

- [ ] Is a recognized Apple domain or valid app bundle ID
- [ ] Not a common typo (`com.apple.mdmclient` -> `com.apple.mdm`)
- [ ] **Not deprecated** — no `com.apple.systempreferences` PayloadType

## No Deprecated Patterns (macOS 13+ baseline)

- [ ] No `EnabledPreferencePanes` key anywhere
- [ ] No `DisabledPreferencePanes` key anywhere
- [ ] No old pane IDs (`com.apple.preference.*`, `com.apple.preferences.*`)
- [ ] Uses `DisabledSystemSettings` with extension IDs (`com.apple.*-Settings.extension`) if restricting System Settings
- [ ] No other deprecated PayloadTypes or keys (check `apple-schema-*.yaml` files)

## Plist Validity

- [ ] `plutil -lint <file>` passes
- [ ] No unclosed tags
- [ ] No invalid plist data types

## Quick Terminal Commands

```bash
# Validate XML structure
plutil -lint MyProfile.mobileconfig

# Generate a UUID
uuidgen
```
