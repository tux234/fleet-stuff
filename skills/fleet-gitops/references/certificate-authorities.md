# Certificate Authorities Schema (org_settings only)

Fleet Premium. Configure CAs to help end users connect to Wi-Fi and VPN.

## digicert

| Key | Type | Notes |
|---|---|---|
| `name` | string | Letters, numbers, underscores only. Used in `$FLEET_VAR_DIGICERT_*_<NAME>` |
| `url` | string | default: `https://one.digicert.com` |
| `api_token` | string | Auth token for DigiCert |
| `profile_id` | string | Certificate profile ID |
| `certificate_common_name` | string | Certificate CN |
| `certificate_user_principal_names` | array | UPN in SAN |
| `certificate_seat_id` | string | DigiCert license seat ID |

## ndes_scep_proxy

| Key | Type | Notes |
|---|---|---|
| `url` | string | NDES SCEP endpoint |
| `admin_url` | string | NDES admin endpoint |
| `username` | string | |
| `password` | string | |

## custom_scep_proxy

| Key | Type | Notes |
|---|---|---|
| `name` | string | Letters, numbers, underscores only |
| `url` | string | SCEP server URL |
| `challenge` | string | Static challenge password |

## custom_est_proxy

| Key | Type | Notes |
|---|---|---|
| `name` | string | Letters, numbers, underscores only |
| `url` | string | EST endpoint URL |
| `username` | string | |
| `password` | string | |

## hydrant

| Key | Type | Notes |
|---|---|---|
| `name` | string | Letters, numbers, underscores only |
| `url` | string | EST endpoint from Hydrant |
| `client_id` | string | From Hydrant |
| `client_secret` | string | From Hydrant |

## smallstep

| Key | Type | Notes |
|---|---|---|
| `name` | string | Letters, numbers, underscores only |
| `url` | string | SCEP URL from Smallstep |
| `challenge_url` | string | Webhook URL from Smallstep |
| `username` | string | Challenge Basic Auth username |
| `password` | string | Challenge Basic Auth password |

## Example

```yaml
org_settings:
  certificate_authorities:
    digicert:
      - name: DIGICERT_WIFI
        url: https://one.digicert.com
        api_token: $DIGICERT_API_TOKEN
        profile_id: 926dbcdd-41c4-4fe5-96c3-b6a7f0da81d8
        certificate_common_name: $FLEET_VAR_HOST_HARDWARE_SERIAL@example.com
    ndes_scep_proxy:
      url: https://example.com/certsrv/mscep/mscep.dll
      admin_url: https://example.com/certsrv/mscep_admin/
      username: Administrator@example.com
      password: $NDES_PASSWORD
    custom_scep_proxy:
      - name: SCEP_VPN
        url: https://example.com/scep
        challenge: $SCEP_VPN_CHALLENGE
    smallstep:
      - name: SMALLSTEP_WIFI
        url: https://example.scep.smallstep.com/p/agents/integration-fleet
        challenge_url: https://example.scep.smallstep.com/.../challenge
        username: $SMALLSTEP_USERNAME
        password: $SMALLSTEP_PASSWORD
```
