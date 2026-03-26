---
description: "Expert at using and scripting against the Fleet REST API for device management automation."
---

# Fleet REST API Skill

Expert at using and scripting against the Fleet REST API for device management automation.

## When to Activate

- User asks to call, script, or automate Fleet API endpoints
- Mentions `fleetctl`, Fleet API, or Fleet REST API
- Wants to manage hosts, policies, software, profiles, or labels via API
- Asks about API authentication, pagination, or error handling
- Needs to build integrations or webhooks with Fleet

## Step 1: Read Context

Before starting, read these for accumulated knowledge:
- Read `learnings.md` — known gotchas and patterns from prior sessions

## Step 2: Core Rules (Always Enforce)

### Authentication
- All requests require `Authorization: Bearer <token>` header
- Get token from Fleet UI (My account > Get API token) or `POST /api/v1/fleet/login`
- SSO/MFA users cannot use email/password login — must get token from UI
- For GitOps automation, create API-only users: `fleetctl user create --api-only`

### Base URL pattern
All endpoints follow: `<fleet-url>/api/v1/fleet/<resource>`

### Pagination
Most list endpoints support: `page`, `per_page`, `order_key`, `order_direction` (asc/desc)

### Request body limit
Default 1MiB (`FLEET_SERVER_DEFAULT_MAX_REQUEST_BODY_SIZE`), unless endpoint specifies otherwise.

### Error format
```json
{
  "message": "Description of the error",
  "errors": [{"name": "field_name", "reason": "specific reason"}],
  "uuid": "unique-error-id"
}
```

## Step 3: Look Up Endpoints As Needed

Load the specific reference file for the API domain the user needs:

| When working with... | Read this file |
|---|---|
| Full endpoint index (all 210 endpoints) | `references/endpoint-index.md` |
| Hosts (list, get, delete, lock, wipe, MDM, labels) | `references/api-hosts.md` |
| Software (packages, App Store, Fleet-maintained, install) | `references/api-software.md` |
| Policies & Reports (CRUD, automations) | `references/api-policies-reports.md` |
| OS Settings (profiles, disk encryption, status) | `references/api-os-settings.md` |
| Fleets, Labels, Users | `references/api-fleets-labels-users.md` |
| Config, Auth, Integrations, Scripts, Commands | `references/api-config-misc.md` |

### External reference
- Full API docs (canonical): https://fleetdm.com/docs/rest-api/rest-api
- Fleet tables (osquery): https://fleetdm.com/tables

## Step 4: Build the Request

### Using curl
```bash
curl -s -H "Authorization: Bearer $FLEET_API_TOKEN" \
  "https://fleet.example.com/api/v1/fleet/hosts?per_page=10"
```

### Using fleetctl
```bash
fleetctl api get /api/v1/fleet/hosts --query per_page=10
```

### Common patterns
1. **List + filter**: Most list endpoints accept `query`, `fleet_id`, `label_id`, `platform`
2. **By ID vs identifier**: Hosts can be fetched by ID (`/hosts/:id`) or identifier (`/hosts/identifier/:identifier` where identifier is hostname, UUID, or serial)
3. **Batch operations**: Use `POST /api/v1/fleet/hosts/delete` (body with IDs) instead of deleting one-by-one
4. **Async operations**: Lock, wipe, MDM commands are queued — check status via activities endpoint

## Step 5: Validate & Test

- Use `--dry-run` flag with `fleetctl gitops` for config changes
- Check response status codes: 200 (success), 201 (created), 204 (deleted), 4xx (client error), 5xx (server error)
- For profile uploads, use `multipart/form-data` not JSON

## Step 6: Keep Index Current

The endpoint index can go stale as Fleet releases new versions. Use the scripts to update:

- `scripts/update-endpoint-index.sh` — Regenerate index from latest API docs (fetches from GitHub or local file)
- `scripts/validate-endpoints.sh` — Probe a live Fleet instance for removed/changed endpoints

Run `update-endpoint-index.sh` when working with a newer Fleet version or when an endpoint returns 404.

## Step 7: Capture Learnings

After every session, update `learnings.md`:
- **Failures** → new Rule entry (what broke, fix, when to check)
- **Successes** → new Observation entry (what worked, when to reuse)
