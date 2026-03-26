# Fleet GitOps Scope Rules

What can be configured where. Getting this wrong causes silent resets or errors.

## Legend

- **Global** = `default.yml` under `org_settings:`
- **Fleet** = `fleets/fleet-name.yml` under `settings:`
- **Unassigned** = `fleets/unassigned.yml` under `settings:`
- **Global only** = CANNOT be set at fleet level
- **Fleet/Unassigned only** = CANNOT be set globally

## Top-Level Keys

| Key | Global | Fleet | Unassigned | Notes |
|---|---|---|---|---|
| `policies` | Yes | Yes | Yes | Automations (run_script, install_software) only in fleet/unassigned |
| `reports` | Yes | Yes | No | |
| `agent_options` | Yes | Yes | No | |
| `controls` | Yes | Yes | Yes | Some sub-keys are global-only |
| `software` | No | Yes | Yes | |
| `labels` | Yes | Yes | No | Not in unassigned.yml |
| `org_settings` | Yes | — | — | Global config wrapper |
| `settings` | — | Yes | Yes | Fleet config wrapper |

## controls Sub-Keys

| Sub-key | Global | Fleet | Unassigned |
|---|---|---|---|
| `scripts` | Yes | Yes | Yes |
| `macos_settings.custom_settings` | Yes | Yes | Yes |
| `windows_settings.custom_settings` | Yes | Yes | Yes |
| `android_settings` | Yes | Yes | Yes |
| `enable_disk_encryption` | Yes | Yes | Yes |
| `windows_require_bitlocker_pin` | Yes | Yes | Yes |
| `macos_updates` | Yes | Yes | Yes |
| `ios_updates` | Yes | Yes | Yes |
| `ipados_updates` | Yes | Yes | Yes |
| `windows_updates` | Yes | Yes | Yes |
| `macos_setup` | No | Yes | Yes |
| `macos_migration` | **Global only** | No | No |
| `windows_enabled_and_configured` | **Global only** | No | No |
| `windows_entra_tenant_ids` | **Global only** | No | No |
| `enable_turn_on_windows_mdm_manually` | **Global only** | No | No |
| `windows_migration_enabled` | **Global only** | No | No |

## org_settings Sub-Keys (Global Only)

These can ONLY be in `default.yml` under `org_settings:`:

- `org_info`
- `server_settings`
- `sso_settings`
- `fleet_desktop`
- `smtp_settings`
- `mdm.apple_business_manager`
- `mdm.volume_purchasing_program`
- `mdm.end_user_authentication`
- `mdm.end_user_license_agreement`
- `mdm.apple_server_url`
- `certificate_authorities`
- `yara_rules`

## Shared Settings (Both Levels)

These can be in EITHER `org_settings` (global) or `settings` (fleet):

- `features`
- `host_expiry_settings`
- `secrets`
- `integrations`
- `webhook_settings`

## Deletion Behavior

| Key | Behavior when key is present |
|---|---|
| `labels` | Labels NOT listed are **deleted** |
| `policies` | Policies NOT listed are **deleted** |
| `software` | Software NOT listed is **deleted** |
| `controls.scripts` | Scripts NOT listed are **deleted** |
| Any missing/misspelled key | Value **reset to default** |

**Safe approach**: If you don't want to manage something via GitOps, omit the key entirely.
