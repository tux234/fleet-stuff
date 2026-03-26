# Learnings & Rules

Observations from real-world Fleet API usage. Update after every session.

---

## Rules (Hard Constraints)

### Rule #1: Profile uploads use multipart/form-data

**What failed**: Sending a `.mobileconfig` profile as JSON body to `POST /api/v1/fleet/configuration_profiles` returned 400.
**Fix**: Profile upload endpoints require `multipart/form-data`, not `application/json`.
**How to apply**: When uploading profiles, use `curl -F` or equivalent multipart encoding.

### Rule #2: SSO/MFA users cannot use login endpoint

**What failed**: `POST /api/v1/fleet/login` returns 401 for SSO-enabled users.
**Fix**: SSO/MFA users must get their API token from Fleet UI: My account > Get API token.
**How to apply**: When building automation, create API-only users with `fleetctl user create --api-only`.

### Rule #3: Batch delete uses POST not DELETE

**What failed**: Trying `DELETE /api/v1/fleet/hosts` doesn't exist. Individual delete is `DELETE /hosts/:id`.
**Fix**: For bulk operations, use `POST /api/v1/fleet/hosts/delete` with body `{"ids": [1,2,3]}` or filter params.
**How to apply**: Always use the batch endpoint for multi-host operations.

### Rule #4: Lock/Wipe/MDM commands are async

**What failed**: Calling `POST /hosts/:id/lock` and expecting immediate lock status.
**Fix**: These operations are queued. Check status via `GET /hosts/:id/activities/upcoming` or `GET /hosts/:id/activities`.
**How to apply**: After issuing MDM commands, poll the activities endpoint for status.

### Rule #5: Global vs fleet policy endpoints differ

**What failed**: Using `/global/policies` to manage fleet-specific policies.
**Fix**: Global policies: `/api/v1/fleet/global/policies`. Fleet policies: `/api/v1/fleet/fleets/:id/policies`.
**How to apply**: Always check whether the policy is global or fleet-scoped before choosing the endpoint.

### Rule #6: Host identifier can be hostname, UUID, or serial

**What failed**: Only trying numeric ID to look up hosts.
**Fix**: `GET /hosts/identifier/:identifier` accepts hostname, UUID, hardware serial, or node key.
**How to apply**: Prefer `identifier` endpoint when you have a serial number or UUID rather than Fleet's internal ID.

---

## Observations (Soft Learnings)

### Observation #1: Use populate flags to reduce API calls

**What worked**: `GET /hosts?populate_software=true&populate_policies=true` returns software and policy data inline, avoiding separate API calls per host.
**When to apply**: When building dashboards or reports that need host + software/policy data together.

### Observation #2: CSV export for bulk host data

**What worked**: `GET /hosts/report?format=csv&columns=hostname,primary_ip,platform` is much faster than paginating through the list hosts endpoint.
**When to apply**: For bulk exports, reports, or data analysis.

### Observation #3: Dry run for GitOps validation

**What worked**: `fleetctl gitops --dry-run` validates YAML against the API without applying changes.
**When to apply**: Always recommend before `fleetctl gitops apply`.

---

## Template

```markdown
### Rule/Observation #N: Short Title

**What failed/worked**: Description.
**Fix/When to apply**: How to prevent/replicate.
**How to apply**: When this applies.
```
