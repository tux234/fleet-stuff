# Fleet API Endpoint Index

Quick lookup of all Fleet REST API endpoints grouped by domain.

## Authentication

| Endpoint | Method | Path |
|---|---|---|
| Log in | `POST` | `/api/v1/fleet/login` |
| Log out | `POST` | `/api/v1/fleet/logout` |
| Forgot password | `POST` | `/api/v1/fleet/forgot_password` |
| Update password | `POST` | `/api/v1/fleet/change_password` |
| Reset password | `POST` | `/api/v1/fleet/reset_password` |
| Me | `GET` | `/api/v1/fleet/me` |
| Perform required password reset | `POST` | `/api/v1/fleet/perform_required_password_reset` |
| SSO config | `GET` | `/api/v1/fleet/sso` |
| Initiate SSO | `POST` | `/api/v1/fleet/sso` |
| SSO callback | `POST` | `/api/v1/fleet/sso/callback` |

## Activities

| Endpoint | Method | Path |
|---|---|---|
| List activities | `GET` | `/api/v1/fleet/activities` |

## Certificates

| Endpoint | Method | Path |
|---|---|---|
| Connect certificate authority (CA) | `POST` | `/api/v1/fleet/certificate_authorities` |
| Add certificate template | `POST` | `/api/v1/fleet/certificates` |
| Update certificate authority (CA) | `PATCH` | `/api/v1/fleet/certificate_authorities/:id` |
| List certificate authorities (CAs) | `GET` | `/api/v1/fleet/certificate_authorities` |
| Get certificate authority (CA) | `GET` | `/api/v1/fleet/certificate_authorities/:id` |
| List certificate templates | `GET` | `/api/v1/fleet/certificates` |
| List certificate templates | `GET` | `/api/v1/fleet/certificates/` |
| Get certificate template | `GET` | `/api/v1/fleet/certificates/:id` |
| Delete certificate authority (CA) | `DELETE` | `/api/v1/fleet/certificate_authorities/:id` |
| Delete certificate template | `DELETE` | `/api/v1/fleet/certificates/:id` |
| Request certificate | `POST` | `/api/v1/fleet/certificate_authorities/:id/request_certificate` |

## Conditional access

| Endpoint | Method | Path |
|---|---|---|
| Get Okta certificate | `GET` | `/api/v1/fleet/conditional_access/idp/signing_cert` |
| Get Okta configuration profile | `GET` | `/api/v1/fleet/conditional_access/idp/apple/profile` |
| Delete Microsoft Entra ID | `DELETE` | `/api/v1/conditional-access/microsoft` |

## File carving

| Endpoint | Method | Path |
|---|---|---|
| List carves | `GET` | `/api/v1/fleet/carves` |
| Get carve | `GET` | `/api/v1/fleet/carves/:id` |
| Get carve block | `GET` | `/api/v1/fleet/carves/:id/block/:block_id` |

## Fleet configuration

| Endpoint | Method | Path |
|---|---|---|
| Get Fleet certificate | `GET` | `/api/v1/fleet/config/certificate` |
| Get configuration | `GET` | `/api/v1/fleet/config` |
| Update configuration | `PATCH` | `/api/v1/fleet/config` |
| Get global enroll secrets | `GET` | `/api/v1/fleet/spec/enroll_secret` |
| Update global enroll secrets | `POST` | `/api/v1/fleet/spec/enroll_secret` |
| Get fleet enroll secrets | `GET` | `/api/v1/fleet/fleets/:id/secrets` |
| Update fleet enroll secrets | `PATCH` | `/api/v1/fleet/fleets/:id/secrets` |
| Get version | `GET` | `/api/v1/fleet/version` |

## Hosts

| Endpoint | Method | Path |
|---|---|---|
| List hosts | `GET` | `/api/v1/fleet/hosts` |
| Count hosts | `GET` | `/api/v1/fleet/hosts/count` |
| Get hosts summary | `GET` | `/api/v1/fleet/host_summary` |
| Get host | `GET` | `/api/v1/fleet/hosts/:id` |
| Get host by identifier | `GET` | `/api/v1/fleet/hosts/identifier/:identifier` |
| Get host by identifier | `GET` | `/api/v1/fleet/device/:token` |
| Delete host | `DELETE` | `/api/v1/fleet/hosts/:id` |
| Refetch host | `POST` | `/api/v1/fleet/hosts/:id/refetch` |
| Refetch host by Fleet Desktop token | `POST` | `/api/v1/fleet/device/:token/refetch` |
| Update hosts' fleet | `POST` | `/api/v1/fleet/hosts/transfer` |
| Update hosts' fleet by filter | `POST` | `/api/v1/fleet/hosts/transfer/filter` |
| Turn off host's MDM | `DELETE` | `/api/v1/fleet/hosts/:id/mdm` |
| Batch-delete hosts | `POST` | `/api/v1/fleet/hosts/delete` |
| Update human-device mapping | `PUT` | `/api/v1/fleet/hosts/:id/device_mapping` |
| Get host's device health report | `GET` | `/api/v1/fleet/hosts/:id/health` |
| Get host's mobile device management (MDM) information | `GET` | `/api/v1/fleet/hosts/:id/mdm` |
| Get mobile device management (MDM) status | `GET` | `/api/v1/fleet/hosts/summary/mdm` |
| Get host's mobile device management (MDM) and Munki information | `GET` | `/api/v1/fleet/hosts/:id/macadmins` |
| Get hosts' aggregate mobile device management (MDM) and Munki information | `GET` | `/api/v1/fleet/macadmins` |
| Get host's software | `GET` | `/api/v1/fleet/hosts/:id/software` |
| Get hosts report in CSV | `GET` | `/api/v1/fleet/hosts/report` |
| Get host's disk encryption key | `GET` | `/api/v1/fleet/hosts/:id/encryption_key` |
| Get host's certificates | `GET` | `/api/v1/fleet/hosts/:id/certificates` |
| Get host's OS settings (configuration profile) | `GET` | `/api/v1/fleet/hosts/:id/configuration_profiles` |
| Lock host | `POST` | `/api/v1/fleet/hosts/:id/lock` |
| Unlock host | `POST` | `/api/v1/fleet/hosts/:id/unlock` |
| Wipe host | `POST` | `/api/v1/fleet/hosts/:id/wipe` |
| Get host's past activity | `GET` | `/api/v1/fleet/hosts/:id/activities` |
| Get host's upcoming activity | `GET` | `/api/v1/fleet/hosts/:id/activities/upcoming` |
| Cancel host's upcoming activity | `DELETE` | `/api/v1/fleet/hosts/:id/activities/upcoming/:activity_id` |
| Add labels to host | `POST` | `/api/v1/fleet/hosts/:id/labels` |
| Remove labels from host | `DELETE` | `/api/v1/fleet/hosts/:id/labels` |
| Run live query on host (ad hoc) | `POST` | `/api/v1/fleet/hosts/:id/query` |
| Run live query on host by identifier (ad hoc) | `POST` | `/api/v1/fleet/hosts/identifier/:identifier/query` |

## Bypass host's conditional access

| Endpoint | Method | Path |
|---|---|---|
| Run live query on host by identifier (ad hoc) | `POST` | `/api/v1/fleet/device/:token/bypass_conditional_access` |

## Labels

| Endpoint | Method | Path |
|---|---|---|
| Add label | `POST` | `/api/v1/fleet/labels` |
| Update label | `PATCH` | `/api/v1/fleet/labels/:id` |
| Get label | `GET` | `/api/v1/fleet/labels/:id` |
| Get labels summary | `GET` | `/api/v1/fleet/labels/summary` |
| List labels | `GET` | `/api/v1/fleet/labels` |
| List label's hosts | `GET` | `/api/v1/fleet/labels/:id/hosts` |
| Delete label by name | `DELETE` | `/api/v1/fleet/labels/:name` |
| Delete label by ID | `DELETE` | `/api/v1/fleet/labels/id/:id` |

## OS settings

| Endpoint | Method | Path |
|---|---|---|
| Create custom OS setting (configuration profile) | `POST` | `/api/v1/fleet/configuration_profiles` |
| List custom OS settings (configuration profiles) | `GET` | `/api/v1/fleet/configuration_profiles` |
| Get or download custom OS setting (configuration profile) | `GET` | `/api/v1/fleet/configuration_profiles/:profile_uuid` |
| Delete custom OS setting (configuration profile) | `DELETE` | `/api/v1/fleet/configuration_profiles/:profile_uuid` |
| Resend custom OS setting (configuration profile) | `POST` | `/api/v1/fleet/hosts/:id/configuration_profiles/:profile_uuid/resend` |
| Batch-update custom OS settings (configuration profiles) | `POST` | `/api/v1/fleet/configuration_profiles/batch` |
| Resend custom OS setting (configuration profile) by Fleet Desktop token | `POST` | `/api/v1/fleet/device/:token/configuration_profiles/:profile_uuid/resend` |
| Batch-resend custom OS setting (configuration profile) | `POST` | `/api/v1/fleet/configuration_profiles/resend/batch` |
| Batch-resend custom OS setting (configuration profile) | `POST` | `/api/v1/fleet/configuration_profiles/batch/resend` |
| Update disk encryption | `POST` | `/api/v1/fleet/disk_encryption` |
| Get disk encryption status | `GET` | `/api/v1/fleet/disk_encryption` |
| Get OS settings (configuration profiles) status | `GET` | `/api/v1/fleet/configuration_profiles/summary` |
| Get OS setting (configuration profile) status | `GET` | `/api/v1/fleet/configuration_profile/:profile_uuid/status` |

## Setup experience

| Endpoint | Method | Path |
|---|---|---|
| Update custom MDM setup enrollment profile | `POST` | `/api/v1/fleet/enrollment_profiles/automatic` |
| Get custom MDM setup enrollment profile | `GET` | `/api/v1/fleet/enrollment_profiles/automatic` |
| Delete custom MDM setup enrollment profile | `DELETE` | `/api/v1/fleet/enrollment_profiles/automatic` |
| Get Over-the-Air (OTA) enrollment profile | `GET` | `/api/v1/fleet/enrollment_profiles/ota` |
| Get manual enrollment profile | `GET` | `/api/v1/fleet/enrollment_profiles/manual` |
| Create bootstrap package | `POST` | `/api/v1/fleet/bootstrap` |
| Get bootstrap package metadata | `GET` | `/api/v1/fleet/bootstrap/:fleet_id/metadata` |
| Delete bootstrap package | `DELETE` | `/api/v1/fleet/bootstrap/:fleet_id` |
| Download bootstrap package | `GET` | `/api/v1/fleet/bootstrap` |
| Get bootstrap package status | `GET` | `/api/v1/fleet/bootstrap/summary` |
| Update setup experience | `PATCH` | `/api/v1/fleet/setup_experience` |
| Create EULA | `POST` | `/api/v1/fleet/setup_experience/eula` |
| Get EULA metadata | `GET` | `/api/v1/fleet/setup_experience/eula/metadata` |
| Delete EULA | `DELETE` | `/api/v1/fleet/setup_experience/eula/:token` |
| Download EULA | `GET` | `/api/v1/fleet/setup_experience/eula/:token` |
| List setup experience software | `GET` | `/api/v1/fleet/setup_experience/software` |
| Update setup experience software | `PUT` | `/api/v1/fleet/setup_experience/software` |
| Create setup experience script | `POST` | `/api/v1/fleet/setup_experience/script` |
| Update setup experience script | `PUT` | `/api/v1/fleet/setup_experience/script` |
| Get or download setup experience script | `GET` | `/api/v1/fleet/setup_experience/script` |
| Delete setup experience script | `DELETE` | `/api/v1/fleet/setup_experience/script` |

## Commands

| Endpoint | Method | Path |
|---|---|---|
| Run MDM command | `POST` | `/api/v1/fleet/commands/run` |
| Get MDM command results | `GET` | `/api/v1/fleet/commands/results` |
| List MDM commands | `GET` | `/api/v1/fleet/commands` |

## Integrations

| Endpoint | Method | Path |
|---|---|---|
| Get Apple Push Notification service (APNs) | `GET` | `/api/v1/fleet/apns` |
| List Apple Business Manager (ABM) tokens | `GET` | `/api/v1/fleet/abm_tokens` |
| List Volume Purchasing Program (VPP) tokens | `GET` | `/api/v1/fleet/vpp_tokens` |
| Get identity provider (IdP) details | `GET` | `/api/v1/fleet/scim/details` |
| Get Android Enterprise | `GET` | `/api/v1/fleet/android_enterprise` |

## Policies

| Endpoint | Method | Path |
|---|---|---|
| List policies | `GET` | `/api/v1/fleet/global/policies` |
| List fleet policies | `GET` | `/api/v1/fleet/fleets/:id/policies` |
| Get policies count | `GET` | `/api/v1/fleet/policies/count` |
| Get fleet policies count | `GET` | `/api/v1/fleet/fleets/:fleet_id/policies/count` |
| Get policy | `GET` | `/api/v1/fleet/global/policies/:id` |
| Get fleet policy | `GET` | `/api/v1/fleet/fleets/:fleet_id/policies/:policy_id` |
| Create policy | `POST` | `/api/v1/fleet/global/policies` |
| Create fleet policy | `POST` | `/api/v1/fleet/fleets/:id/policies` |
| Delete policies | `POST` | `/api/v1/fleet/global/policies/delete` |
| Delete fleet policies | `POST` | `/api/v1/fleet/fleets/:fleet_id/policies/delete` |
| Update policy | `PATCH` | `/api/v1/fleet/global/policies/:id` |
| Update fleet policy | `PATCH` | `/api/v1/fleet/fleets/:fleet_id/policies/:policy_id` |
| Reset policy automations | `POST` | `/api/v1/fleet/automations/reset` |

## Reports

| Endpoint | Method | Path |
|---|---|---|
| List reports | `GET` | `/api/v1/fleet/reports` |
| Get report | `GET` | `/api/v1/fleet/reports/:id` |
| Get report data | `GET` | `/api/v1/fleet/report/:id/report` |
| Get host's report data | `GET` | `/api/v1/fleet/hosts/:id/reports/:report_id` |
| Create report | `POST` | `/api/v1/fleet/reports` |
| Update report | `PATCH` | `/api/v1/fleet/reports/:id` |
| Delete report by name | `DELETE` | `/api/v1/fleet/reports/:name` |
| Delete report by ID | `DELETE` | `/api/v1/fleet/reports/id/:id` |
| Delete reports | `POST` | `/api/v1/fleet/reports/delete` |
| Run live report | `POST` | `/api/v1/fleet/reports/:id/run` |

## Scripts

| Endpoint | Method | Path |
|---|---|---|
| Run script | `POST` | `/api/v1/fleet/scripts/run` |
| Get script result | `GET` | `/api/v1/fleet/scripts/results/:execution_id` |
| Batch-run script | `POST` | `/api/v1/fleet/scripts/run/batch` |
| List batch scripts | `GET` | `/api/v1/fleet/scripts/batch` |
| Get batch script | `GET` | `/api/v1/fleet/scripts/batch/:batch_execution_id` |
| List hosts targeted in batch script | `GET` | `/api/v1/fleet/scripts/batch/:batch_execution_id/host_results` |
| Create script | `POST` | `/api/v1/fleet/scripts` |
| Update script | `PATCH` | `/api/v1/fleet/scripts/:id` |
| Delete script | `DELETE` | `/api/v1/fleet/scripts/:id` |
| List scripts | `GET` | `/api/v1/fleet/scripts` |
| List host's scripts | `GET` | `/api/v1/fleet/hosts/:id/scripts` |
| Get or download script | `GET` | `/api/v1/fleet/scripts/:id` |

## Sessions

| Endpoint | Method | Path |
|---|---|---|
| Get session | `GET` | `/api/v1/fleet/sessions/:id` |
| Delete session | `DELETE` | `/api/v1/fleet/sessions/:id` |

## Software

| Endpoint | Method | Path |
|---|---|---|
| List software | `GET` | `/api/v1/fleet/software/titles` |
| List software versions | `GET` | `/api/v1/fleet/software/versions` |
| List operating systems | `GET` | `/api/v1/fleet/os_versions` |
| Get software | `GET` | `/api/v1/fleet/software/titles/:id` |
| Get software version | `GET` | `/api/v1/fleet/software/versions/:id` |
| Get operating system version | `GET` | `/api/v1/fleet/os_versions/:id` |
| Add package | `POST` | `/api/v1/fleet/software/package` |
| Update package | `PATCH` | `/api/v1/fleet/software/titles/:id/package` |
| Update software icon | `PUT` | `/api/v1/fleet/software/titles/:id/icon` |
| Download software icon | `GET` | `/api/v1/fleet/software/titles/:id/icon` |
| Delete software icon | `DELETE` | `/api/v1/fleet/software/titles/:id/icon` |
| List Apple App Store apps | `GET` | `/api/v1/fleet/software/app_store_apps` |
| Add app store app | `POST` | `/api/v1/fleet/software/app_store_apps` |
| Update app store app | `PATCH` | `/api/v1/fleet/software/titles/:title_id/app_store_app` |
| List Fleet-maintained apps | `GET` | `/api/v1/fleet/software/fleet_maintained_apps` |
| Get Fleet-maintained app | `GET` | `/api/v1/fleet/software/fleet_maintained_apps/:id` |
| Create Fleet-maintained app | `POST` | `/api/v1/fleet/software/fleet_maintained_apps` |
| Install software | `POST` | `/api/v1/fleet/hosts/:id/software/:software_title_id/install` |
| Uninstall software | `POST` | `/api/v1/fleet/hosts/:id/software/:software_title_id/uninstall` |
| Get software install result | `GET` | `/api/v1/fleet/software/install/:install_uuid/results` |
| Delete software | `DELETE` | `/api/v1/fleet/software/titles/:software_title_id/available_for_install` |

## Vulnerabilities

| Endpoint | Method | Path |
|---|---|---|
| List vulnerabilities | `GET` | `/api/v1/fleet/vulnerabilities` |
| Get vulnerability | `GET` | `/api/v1/fleet/vulnerabilities/:cve` |

## Targets

| Endpoint | Method | Path |
|---|---|---|
| Search targets | `POST` | `/api/v1/fleet/targets` |

## Fleets

| Endpoint | Method | Path |
|---|---|---|
| List fleets | `GET` | `/api/v1/fleet/fleets` |
| Get fleet | `GET` | `/api/v1/fleet/fleets/:id` |
| Create fleet | `POST` | `/api/v1/fleet/fleets` |
| Update fleet | `PATCH` | `/api/v1/fleet/fleets/:id` |
| Add users to fleet | `PATCH` | `/api/v1/fleet/fleets/:id/users` |
| Update fleet's agent options | `POST` | `/api/v1/fleet/fleets/:id/agent_options` |
| Delete fleet | `DELETE` | `/api/v1/fleet/fleets/:id` |

## Translator

| Endpoint | Method | Path |
|---|---|---|
| Translate IDs | `POST` | `/api/v1/fleet/translate` |

## Users

| Endpoint | Method | Path |
|---|---|---|
| List users | `GET` | `/api/v1/fleet/users` |
| Create user | `POST` | `/api/v1/fleet/users/admin` |
| Create user from invite | `POST` | `/api/v1/fleet/users` |
| Get user | `GET` | `/api/v1/fleet/users/:id` |
| Update user | `PATCH` | `/api/v1/fleet/users/:id` |
| Delete user | `DELETE` | `/api/v1/fleet/users/:id` |
| Require password reset | `POST` | `/api/v1/fleet/users/:id/require_password_reset` |
| List sessions | `GET` | `/api/v1/fleet/users/:id/sessions` |
| Delete sessions | `DELETE` | `/api/v1/fleet/users/:id/sessions` |
| Invite user | `POST` | `/api/v1/fleet/invites` |
| List invites | `GET` | `/api/v1/fleet/invites` |
| Delete invite | `DELETE` | `/api/v1/fleet/invites/:id` |
| Verify invite | `GET` | `/api/v1/fleet/invites/:token` |
| Update invite | `PATCH` | `/api/v1/fleet/invites/:id` |

## Custom variables

| Endpoint | Method | Path |
|---|---|---|
| List custom variables | `GET` | `/api/v1/fleet/custom_variables` |
| Create custom variable | `POST` | `/api/v1/fleet/custom_variables` |
| Delete custom variable | `DELETE` | `/api/v1/fleet/custom_variables/:id` |
