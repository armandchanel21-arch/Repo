```markdown
# INSTALL.md

This ZIP contains installable APK(s) and helper scripts.

How to use:

1. Unzip the provided ZIP file:
   unzip mpsy-release-...zip -d mpsy-release

2. Inspect files in the mpsy-release/ directory. Typical contents:
   - app-release.apk (or app-debug.apk)
   - install_apk.sh
   - README.md

3. Install on a device (device must be connected and USB debugging enabled):
   cd mpsy-release
   chmod +x install_apk.sh
   ./install_apk.sh app-release.apk

   Or use adb directly:
   adb install -r app-release.apk

Notes:
- Release APK is signed using the keystore you provided. Debug APK is signed with the debug key and is for testing only.
- Do NOT distribute release keystores or passwords publicly.