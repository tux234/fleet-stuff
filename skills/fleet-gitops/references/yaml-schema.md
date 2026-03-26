# Fleet GitOps YAML Schema Reference

Complete key reference for Fleet GitOps configuration files.

## labels

| Key | Type | Required | Notes |
|---|---|---|---|
| `name` | string | Yes | Must be unique across global and fleet labels |
| `description` | string | No | |
| `platform` | string | No | `darwin`, `windows`, `ubuntu`, `centos`. Empty = all |
| `label_membership_type` | string | No | `dynamic` (default), `manual`, `host_vitals` |
| `query` | string | Conditional | SQL query. Only if `dynamic` |
| `hosts` | array | Conditional | List of `id`, `hardware_serial`, or `uuid`. Only if `manual` |
| `criteria.vital` | string | Conditional | Only if `host_vitals` |
| `criteria.value` | string | Conditional | Only if `host_vitals` |

Only ONE of `query`, `hosts`, or `criteria`. `hostname` identifier is **deprecated**.

## policies

| Key | Type | Required | Notes |
|---|---|---|---|
| `name` | string | Yes | |
| `description` | string | No | |
| `resolution` | string | No | |
| `query` | string | Yes | SQL query |
| `platform` | string | No | `darwin`, `windows`, `linux` |
| `critical` | boolean | No | default: `false` |
| `calendar_events_enabled` | boolean | No | Fleet-level only |
| `conditional_access_enabled` | boolean | No | |
| `labels_include_any` | array | No | |
| `labels_include_all` | array | No | |
| `labels_exclude_any` | array | No | |
| `install_software.package_path` | string | No | Fleet/unassigned only |
| `install_software.hash_sha256` | string | No | Fleet/unassigned only |
| `run_script.path` | string | No | Fleet/unassigned only |

## reports

| Key | Type | Required | Notes |
|---|---|---|---|
| `name` | string | Yes | |
| `description` | string | No | |
| `query` | string | Yes | SQL query |
| `platform` | string | No | `darwin,linux,windows` |
| `interval` | integer | No | Seconds between runs |
| `observer_can_run` | boolean | No | |
| `automations_enabled` | boolean | No | |
| `labels_include_any` | array | No | |

## agent_options

| Key | Type | Notes |
|---|---|---|
| `config.decorators.load` | array | SQL queries run on every agent check-in |
| `config.options.disable_distributed` | boolean | |
| `config.options.distributed_interval` | integer | Seconds |
| `config.options.distributed_plugin` | string | `tls` |
| `config.options.distributed_tls_max_attempts` | integer | |
| `config.options.logger_tls_endpoint` | string | `/api/osquery/log` |
| `config.options.logger_tls_period` | integer | Seconds |
| `config.options.pack_delimiter` | string | `/` |

## controls

| Key | Type | Notes |
|---|---|---|
| `scripts` | array of `{path}` | macOS (.sh), Windows (.ps1), Linux (.sh) |
| `windows_enabled_and_configured` | boolean | org_settings only |
| `windows_entra_tenant_ids` | array | org_settings only |
| `enable_turn_on_windows_mdm_manually` | boolean | org_settings only |
| `windows_migration_enabled` | boolean | org_settings only |
| `enable_disk_encryption` | boolean | |
| `windows_require_bitlocker_pin` | boolean | Requires `enable_disk_encryption: true` |
| `macos_updates.deadline` | string | `YYYY-MM-DD` format |
| `macos_updates.minimum_version` | string | e.g., `"15.1"` |
| `macos_updates.update_new_hosts` | boolean | |
| `ios_updates.deadline` | string | `YYYY-MM-DD` |
| `ios_updates.minimum_version` | string | |
| `ipados_updates.deadline` | string | `YYYY-MM-DD` |
| `ipados_updates.minimum_version` | string | |
| `windows_updates.deadline_days` | integer | |
| `windows_updates.grace_period_days` | integer | |
| `macos_settings.custom_settings` | array | `.mobileconfig` or `.json` (DDM) |
| `windows_settings.custom_settings` | array | `.xml` |
| `android_settings.custom_settings` | array | `.json` |
| `android_settings.certificates` | array | `{name, certificate_authority_name, subject_name}` |
| `macos_setup.bootstrap_package` | string | URL |
| `macos_setup.enable_end_user_authentication` | boolean | |
| `macos_setup.enable_release_device_manually` | boolean | |
| `macos_setup.macos_setup_assistant` | string | Path to `.json` |
| `macos_setup.script` | string | Path to `.sh` |
| `macos_setup.manual_agent_install` | boolean | Experimental |
| `macos_migration.enable` | boolean | org_settings only |
| `macos_migration.mode` | string | `voluntary` or `forced` |
| `macos_migration.webhook_url` | string | |

## software

### packages

| Key | Type | Notes |
|---|---|---|
| `path` | string | Path to `.package.yml` |
| `self_service` | boolean | |
| `setup_experience` | boolean | |
| `categories` | array | Browsers, Communication, Developer tools, Productivity, Security, Utilities |
| `labels_include_any` | array | |
| `labels_exclude_any` | array | |

### Package YAML file keys

| Key | Type | Notes |
|---|---|---|
| `url` | string | Download URL |
| `hash_sha256` | string | Skip download if hash matches existing |
| `display_name` | string | |
| `pre_install_query.path` | string | SQL query path |
| `install_script.path` | string | |
| `uninstall_script.path` | string | |
| `post_install_script.path` | string | |
| `icon.path` | string | Square PNG, 120x120 to 1024x1024 |

### app_store_apps

| Key | Type | Notes |
|---|---|---|
| `app_store_id` | string | Must be quoted. Apple = numeric ID, Android = package name |
| `platform` | string | `darwin`, `ios`, `ipados`, `android` |
| `self_service` | boolean | |
| `setup_experience` | boolean | |
| `categories` | array | |
| `auto_update_enabled` | boolean | |
| `auto_update_window_start` | string | `HH:MM` |
| `auto_update_window_end` | string | `HH:MM` |
| `configuration.path` | string | Android only — managed config JSON |
| `icon.path` | string | |

### fleet_maintained_apps

| Key | Type | Notes |
|---|---|---|
| `slug` | string | e.g., `slack/darwin`. Find in Fleet UI or GitHub |
| `version` | string | Must be quoted. Omit for latest |
| `self_service` | boolean | |
| `setup_experience` | boolean | |
| `categories` | array | |
| `pre_install_query.path` | string | |
| `install_script.path` | string | Override default |
| `uninstall_script.path` | string | Override default |
| `post_install_script.path` | string | |
| `icon.path` | string | |
| `labels_include_any` | array | |
| `labels_exclude_any` | array | |

## org_settings / settings

### features

| Key | Type | Default |
|---|---|---|
| `additional_queries` | dict | `{}` |
| `enable_host_users` | boolean | `true` |
| `enable_software_inventory` | boolean | `true` |

### fleet_desktop (org_settings only)

| Key | Type | Default |
|---|---|---|
| `transparency_url` | string | Fleet default |
| `alternative_browser_host` | string | `""` |

### host_expiry_settings

| Key | Type | Default |
|---|---|---|
| `host_expiry_enabled` | boolean | `false` |
| `host_expiry_window` | integer | `0` (days, must be > 0 if enabled) |

### org_info (org_settings only)

| Key | Type | Default |
|---|---|---|
| `org_name` | string | `""` |
| `org_logo_url` | string | Fleet logo |
| `org_logo_url_light_background` | string | Fleet logo |
| `contact_url` | string | Fleet default |

### secrets

| Key | Type |
|---|---|
| `secret` | string |

### server_settings (org_settings only)

| Key | Type | Default |
|---|---|---|
| `ai_features_disabled` | boolean | `false` |
| `enable_analytics` | boolean | `true` |
| `live_reporting_disabled` | boolean | `false` |
| `discard_reports_data` | boolean | `false` |
| `report_cap` | integer | `1000` |
| `scripts_disabled` | boolean | `false` |
| `server_url` | string | Set during Fleet setup |

### sso_settings (org_settings only)

| Key | Type | Default |
|---|---|---|
| `enable_sso` | boolean | `false` |
| `idp_name` | string | `""` |
| `idp_image_url` | string | `""` |
| `entity_id` | string | `""` |
| `metadata` | string | `""` |
| `metadata_url` | string | `""` |
| `enable_jit_provisioning` | boolean | `false` |
| `enable_sso_idp_login` | boolean | `false` |
| `sso_server_url` | string | `""` |

### webhook_settings

| Key | Type | Default |
|---|---|---|
| `interval` | string | `"24h"` (supports s, m, h) |
| `activities_webhook.enable_activities_webhook` | boolean | `false` |
| `activities_webhook.destination_url` | string | `""` |
| `failing_policies_webhook.enable_failing_policies_webhook` | boolean | `false` |
| `failing_policies_webhook.destination_url` | string | `""` |
| `failing_policies_webhook.policy_ids` | array | `[]` |
| `failing_policies_webhook.host_batch_size` | integer | `0` |
| `host_status_webhook.enable_host_status_webhook` | boolean | `false` |
| `host_status_webhook.destination_url` | string | `""` |
| `host_status_webhook.days_count` | integer | `0` |
| `host_status_webhook.host_percentage` | integer | `0` |
| `vulnerabilities_webhook.enable_vulnerabilities_webhook` | boolean | `false` |
| `vulnerabilities_webhook.destination_url` | string | `""` |
| `vulnerabilities_webhook.host_batch_size` | integer | `0` |

### integrations

| Key | Type | Notes |
|---|---|---|
| `conditional_access_enabled` | boolean | |
| `google_calendar[].api_key_json` | string | org_settings only |
| `google_calendar[].domain` | string | org_settings only |
| `jira[].url` | string | org_settings only |
| `jira[].username` | string | |
| `jira[].api_token` | string | |
| `jira[].project_key` | string | |
| `zendesk[].url` | string | org_settings only |
| `zendesk[].email` | string | |
| `zendesk[].api_token` | string | |
| `zendesk[].group_id` | integer | |

### mdm (org_settings only)

| Key | Type | Notes |
|---|---|---|
| `apple_business_manager[].organization_name` | string | |
| `apple_business_manager[].macos_fleet` | string | Fleet name |
| `apple_business_manager[].ios_fleet` | string | Fleet name |
| `apple_business_manager[].ipados_fleet` | string | Fleet name |
| `volume_purchasing_program[].location` | string | ABM location name |
| `volume_purchasing_program[].fleets` | array | Fleet names or `"All fleets"` |
| `end_user_authentication.idp_name` | string | |
| `end_user_authentication.entity_id` | string | |
| `end_user_authentication.metadata` | string | |
| `end_user_authentication.metadata_url` | string | |
| `end_user_license_agreement` | string | Path to PDF |
| `apple_server_url` | string | |

### certificate_authorities (org_settings only)

See `certificate-authorities.md` for full schema (DigiCert, NDES, custom SCEP, EST, Hydrant, Smallstep).

### yara_rules (org_settings only)

```yaml
org_settings:
  yara_rules:
    - path: ./lib/rule1.yar
```
