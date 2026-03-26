# Fleet Reserved Variables

Variables auto-populated per host when profiles are sent. Use `$FLEET_VAR_*` format in configuration profiles.

## Host Identity Variables

| Variable | Platforms | Description |
|---|---|---|
| `$FLEET_VAR_HOST_END_USER_IDP_USERNAME` | macOS, iOS, iPadOS, Windows | IdP username (e.g., user@example.com). Auto-resends on change. |
| `$FLEET_VAR_HOST_END_USER_IDP_FULL_NAME` | macOS, iOS, iPadOS, Windows | IdP full name. Auto-resends on change. |
| `$FLEET_VAR_HOST_END_USER_IDP_USERNAME_LOCAL_PART` | macOS, iOS, iPadOS, Windows | Local part of email (e.g., john from john@example.com). Auto-resends on change. |
| `$FLEET_VAR_HOST_END_USER_IDP_GROUPS` | macOS, iOS, iPadOS, Windows | Comma-separated IdP groups. Auto-resends on change. |
| `$FLEET_VAR_HOST_END_USER_IDP_DEPARTMENT` | macOS, iOS, iPadOS, Windows | IdP department. Auto-resends on change. |
| `$FLEET_VAR_HOST_UUID` | macOS, iOS, iPadOS, Windows | Hardware UUID |
| `$FLEET_VAR_HOST_HARDWARE_SERIAL` | macOS, iOS, iPadOS, Windows | Hardware serial number |
| `$FLEET_VAR_HOST_PLATFORM` | macOS, iOS, iPadOS, Windows | `"macos"`, `"ios"`, `"ipados"`, or `"windows"` |

## Certificate Authority Variables

| Variable | Platforms | Notes |
|---|---|---|
| `$FLEET_VAR_NDES_SCEP_CHALLENGE` | macOS, iOS, iPadOS | One-time NDES challenge password |
| `$FLEET_VAR_NDES_SCEP_PROXY_URL` | macOS, iOS, iPadOS | NDES SCEP proxy endpoint |
| `$FLEET_VAR_CUSTOM_SCEP_CHALLENGE_<CA_NAME>` | All | Replace `<CA_NAME>` with CA name from config |
| `$FLEET_VAR_CUSTOM_SCEP_PROXY_URL_<CA_NAME>` | All | Replace `<CA_NAME>` with CA name |
| `$FLEET_VAR_SCEP_RENEWAL_ID` | All | Required in OU field for auto-renewal |
| `$FLEET_VAR_DIGICERT_PASSWORD_<CA_NAME>` | macOS, iOS, iPadOS | DigiCert cert decode password |
| `$FLEET_VAR_DIGICERT_DATA_<CA_NAME>` | macOS, iOS, iPadOS | DigiCert base64 cert data |
| `$FLEET_VAR_SCEP_WINDOWS_CERTIFICATE_ID` | Windows | Must be in `<LocURI>` field |
| `$FLEET_VAR_SMALLSTEP_SCEP_CHALLENGE_<CA_NAME>` | macOS, iOS, iPadOS | Smallstep challenge password |
| `$FLEET_VAR_SMALLSTEP_SCEP_PROXY_URL_<CA_NAME>` | macOS, iOS, iPadOS | Smallstep SCEP proxy endpoint |

## Environment Variables

- GitHub Actions and GitLab CI variables: use `$ENV_VARIABLE` format
- Escape `$` with `\$` to prevent expansion
- Use `MY${variable}HERE` for surrounding strings
- In `.mobileconfig` XML, `&`, `<`, `>`, `"`, `'` are auto-escaped in variables

## Gotchas

- CA variables (`$FLEET_VAR_DIGICERT_DATA_*` etc.) that don't exist: dry runs succeed but actual runs fail
- Variables auto-resend profiles when their value changes (IdP variables)
- For Apple profiles: Apple's built-in variables work in ACME, SCEP, and VPN payloads
