# Common PayloadType Reference

## Apple System Payloads

| PayloadType | Purpose | Notes |
|---|---|---|
| `com.apple.applicationaccess` | Restrictions | Disable features, App Store, Siri, etc. |
| `com.apple.Safari` | Safari preferences | Homepage, search engine, security |
| `com.apple.security.firewall` | Firewall | Enable/stealth mode |
| `com.apple.SoftwareUpdate` | Software updates | Auto-install, deferrals |
| `com.apple.screensaver` | Screen saver | Idle time, require password |
| `com.apple.loginwindow` | Login window | Auto-logout, guest, console |
| `com.apple.mobiledevice.passwordpolicy` | Password policy | Length, complexity, expiry |
| `com.apple.MCX` | Managed Client | Misc managed prefs |
| `com.apple.mdm` | MDM protocol | **Not** `com.apple.mdmclient` |
| `com.apple.wifi.managed` | Wi-Fi | SSID, security, proxy |
| `com.apple.vpn.managed` | VPN | IKEv2, IPsec, SSL |
| `com.apple.TCC.configuration-profile-policy` | Privacy (PPPC) | FDA, screen capture, etc. |
| `com.apple.extensiblesso` | SSO extensions | Kerberos, Azure, Okta |
| `com.apple.system-extension-policy` | System extensions | Allow-list by team ID |
| `com.apple.servicemanagement` | Login/background items | Managed login items |
| `com.apple.notificationsettings` | Notifications | Per-app notification rules |
| `com.apple.controlcenter` | Control Center | Show/hide menu items |
| `com.apple.mDNSResponder` | Bonjour/mDNS | Multicast DNS settings |
| `com.apple.locationd` | Location Services | Enable/disable |
| `com.apple.SubmitDiagInfo` | Diagnostics | Auto-submit crash data |
| `com.apple.systempolicy.control` | Gatekeeper | Allow identified developers |
| `com.apple.universalcontrol` | Universal Control | Enable/disable |
| `com.apple.TimeMachine` | Time Machine | Backup settings |
| `com.apple.security.pkcs12` | Certificate (P12) | Install identity cert |
| `com.apple.security.scep` | SCEP | Auto-enroll certificates |
| `com.apple.security.pkcs1` | Certificate (DER) | Install CA cert |
| `com.apple.Terminal` | Terminal.app | Shell, font, colors |
| `com.apple.dock` | Dock | Size, position, auto-hide |
| `com.apple.finder` | Finder | View options, extensions |
## Banned / Deprecated — DO NOT USE

| Banned PayloadType / Key | Why | Use Instead |
|---|---|---|
| `com.apple.systempreferences` | Deprecated macOS 13 | Use specific restrictions per feature |
| `EnabledPreferencePanes` | Deprecated macOS 13 | `DisabledSystemSettings` with extension IDs |
| `DisabledPreferencePanes` | Deprecated macOS 13 | `DisabledSystemSettings` with extension IDs |
| Old pane IDs (`com.apple.preference.*`) | Pre-macOS 13 | Extension IDs (`com.apple.*-Settings.extension`) |
| Old pane IDs (`com.apple.preferences.*`) | Pre-macOS 13 | Extension IDs (`com.apple.*-Settings.extension`) |

If you encounter these in existing profiles, **always flag and replace** with the modern equivalent.

## System Settings Extension IDs (macOS 13+ — use these)

Use with the `DisabledSystemSettings` key. Privacy & Security extensions **cannot** be disabled.

| Extension ID | Controls |
|---|---|
| `com.apple.Accessibility-Settings.extension` | Accessibility |
| `com.apple.AirDrop-Handoff-Settings.extension` | AirDrop & Handoff |
| `com.apple.Battery-Settings.extension` | Battery / Energy |
| `com.apple.BluetoothSettings` | Bluetooth |
| `com.apple.CD-DVD-Settings.extension` | CD/DVD |
| `com.apple.ClassKit-Settings.extension` | ClassKit |
| `com.apple.Classroom-Settings.extension` | Classroom |
| `com.apple.ControlCenter-Settings.extension` | Control Center |
| `com.apple.Date-Time-Settings.extension` | Date & Time |
| `com.apple.Desktop-Settings.extension` | Desktop |
| `com.apple.Displays-Settings.extension` | Displays |
| `com.apple.ExtensionsPreferences` | Extensions |
| `com.apple.Family-Settings.extension` | Family Sharing |
| `com.apple.Focus-Settings.extension` | Focus |
| `com.apple.Game-Center-Settings.extension` | Game Center |
| `com.apple.Game-Controller-Settings.extension` | Game Controller |
| `com.apple.HeadphoneSettings` | Headphone |
| `com.apple.Internet-Accounts-Settings.extension` | Internet Accounts |
| `com.apple.Keyboard-Settings.extension` | Keyboard |
| `com.apple.Localization-Settings.extension` | Language & Region |
| `com.apple.Lock-Screen-Settings.extension` | Lock Screen |
| `com.apple.LoginItems-Settings.extension` | Login Items |
| `com.apple.Mouse-Settings.extension` | Mouse |
| `com.apple.Network-Settings.extension` | Network |
| `com.apple.NetworkExtensionSettingsUI.NESettingsUIExtension` | Network Extensions |
| `com.apple.Notifications-Settings.extension` | Notifications |
| `com.apple.Passwords-Settings.extension` | Passwords |
| `com.apple.Print-Scan-Settings.extension` | Printers & Scanners |
| `com.apple.Screen-Time-Settings.extension` | Screen Time |
| `com.apple.ScreenSaver-Settings.extension` | Screen Saver |
| `com.apple.Sharing-Settings.extension` | Sharing |
| `com.apple.Siri-Settings.extension` | Siri |
| `com.apple.Software-Update-Settings.extension` | Software Update |
| `com.apple.Sound-Settings.extension` | Sound |
| `com.apple.Startup-Disk-Settings.extension` | Startup Disk |
| `com.apple.Time-Machine-Settings.extension` | Time Machine |
| `com.apple.Touch-ID-Settings.extension` | Touch ID |
| `com.apple.Trackpad-Settings.extension` | Trackpad |
| `com.apple.Transfer-Reset-Settings.extension` | Transfer or Reset |
| `com.apple.Users-Groups-Settings.extension` | Users & Groups |
| `com.apple.WalletSettingsExtension` | Wallet |
| `com.apple.Wallpaper-Settings.extension` | Wallpaper |
| `com.apple.settings.Storage` | Storage |
| `com.apple.systempreferences.AppleIDSettings` | Apple ID |
| `com.apple.wifi-settings-extension` | Wi-Fi |

## Common Third-Party Bundles

| PayloadType | App |
|---|---|
| `com.google.Chrome` | Google Chrome |
| `com.microsoft.Word` | Microsoft Word |
| `com.microsoft.Excel` | Microsoft Excel |
| `com.microsoft.Outlook` | Microsoft Outlook |
| `com.microsoft.teams2` | Microsoft Teams (new) |
| `com.microsoft.OneDrive` | OneDrive |
| `com.crowdstrike.falcon.Agent` | CrowdStrike Falcon |
| `com.1password.1password` | 1Password |

## Known Typos / Mistakes

| Wrong | Correct |
|---|---|
| `com.apple.mdmclient` | `com.apple.mdm` |
| `com.apple.mcx.alr` | `com.apple.MCX` |
| `com.apple.preferences.sharing.SharingPrefsExtension` | Valid but unusual — double-check intent |

## SSO ExtensionIdentifier Values

| Value | Provider |
|---|---|
| `com.apple.AppSSOKerberos.KerberosExtension` | Apple Kerberos |
| `com.microsoft.azureauthenticator.ssoextension` | Microsoft Entra (Azure AD) |
| `com.microsoft.CompanyPortalMac.ssoextension` | Microsoft Company Portal |
| `com.okta.mobile.auth-service-extension` | Okta (valid but may warn) |
