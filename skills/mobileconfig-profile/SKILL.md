---
description: "Expert at creating and validating Apple .mobileconfig files for macOS, iOS, and iPadOS."
---

# Apple Configuration Profile (.mobileconfig) Skill

Expert at creating and validating Apple `.mobileconfig` files for macOS, iOS, and iPadOS.

## When to Activate

- User creates, edits, or reviews a `.mobileconfig` file
- Mentions MDM profiles, configuration profiles, or managed preferences
- Asks about PayloadType, PayloadIdentifier, PayloadUUID, or profile structure
- References Fleet GitOps profile authoring

## Step 1: Read Context

Before starting, read these files for accumulated knowledge:
- Read `learnings.md` — known issues and patterns from prior sessions
- Read `references/validation-checklist.md` — quick pre-delivery checklist

## Step 2: Core Rules (Always Enforce)

### PayloadIdentifier — Reverse-DNS only
- **NEVER** use bare UUIDs. Always `com.<org>.profiles.<name>`
- Inner payloads: `com.<org>.profiles.<name>.<uuid-suffix>`
- Default org for Fleet: `com.fleetdm`

### PayloadUUID — Valid RFC 4122
- Uppercase hex only `[0-9A-F]`, format `XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`
- Every UUID in profile must be unique — no duplicates
- Generate with `uuidgen`

### PayloadVersion — Required everywhere
- Must be `<integer>1</integer>` on EVERY dict (outer + each inner payload)
- Never use `<real>1.0</real>` — this is the #1 most common error

### Plist validity
- Well-formed XML with declaration and DOCTYPE
- Validate: `plutil -lint <file>.mobileconfig`

### No deprecated APIs — macOS 13+ baseline
- **BANNED**: `com.apple.systempreferences` PayloadType, `EnabledPreferencePanes`, `DisabledPreferencePanes`, old pane IDs (`com.apple.preference.*`)
- For details on banned patterns and modern replacements, read `references/common-payload-types.md`

## Step 3: Look Up Details As Needed

Load these references only when the specific step requires them:

| When you need... | Read this file |
|---|---|
| Required/optional fields per Apple spec | `references/apple-schema-toplevel.yaml` and `references/apple-schema-common-payload-keys.yaml` |
| Valid PayloadType values, typos, deprecated types | `references/common-payload-types.md` |
| macOS 13+ System Settings extension IDs | `references/common-payload-types.md` (System Settings section) |
| SSO ExtensionIdentifier values | `references/common-payload-types.md` (SSO section) |
| Per-payload schema (e.g., systempreferences) | `references/apple-schema-<payloadtype>.yaml` |
| Starting template for a new profile | `references/template.mobileconfig` |
| Full validation checklist before delivery | `references/validation-checklist.md` |

To add new payload schemas: download from `https://github.com/apple/device-management/blob/release/mdm/profiles/<payloadtype>.yaml` and save to `references/`.

## Step 4: Create or Review

### Creating a New Profile
1. Ask: settings to manage, scope (System/User), org name
2. Generate unique UUIDs (`uuidgen` × number of dicts)
3. Build from `references/template.mobileconfig`
4. Validate using `references/validation-checklist.md`

### Reviewing an Existing Profile
1. Parse the file
2. Check: PayloadIdentifier (reverse-DNS), PayloadUUID (valid hex), PayloadVersion (exists everywhere), PayloadType (known + non-deprecated), plist format
3. Flag deprecated patterns with exact modern replacements
4. Offer to generate a fixed version

## Step 5: Fleet-Specific Conventions

When in a Fleet GitOps context:
- Org prefix: `com.fleetdm`
- Profile ID pattern: `com.fleetdm.profiles.<descriptive-kebab-name>`
- CIS profiles: `com.fleetdm.<cis-benchmark-id>.check`
- Test profiles still need valid structure
- Validate against: Apple device-management repo + ProfileManifests

## Step 6: Capture Learnings

After every session, update `learnings.md`:
- **Failures** → new Issue entry (what broke, root cause, fix)
- **Successes** → new Observation entry (what worked, when to reuse)
- Always read `learnings.md` at start of next session
