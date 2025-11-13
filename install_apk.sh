#!/usr/bin/env bash
# scripts/install_apk.sh
# Small helper to install APK(s) from the zip on an Android device via adb.
# Usage:
#   ./install_apk.sh path/to/app-debug.apk
#   or run without args to install all APKs in current directory matching *.apk
set -euo pipefail

ADB="${ADB:-adb}"

if ! command -v "$ADB" >/dev/null 2>&1; then
  echo "adb not found in PATH. Install Android platform-tools and ensure adb is available."
  exit 1
fi

if [ "$#" -gt 0 ]; then
  APKS=("$@")
else
  APKS=(./*.apk)
fi

if [ "${#APKS[@]}" -eq 0 ]; then
  echo "No APKs found to install."
  exit 2
fi

$ADB devices

for apk in "${APKS[@]}"; do
  if [ -f "$apk" ]; then
    echo "Installing $apk..."
    $ADB install -r "$apk"
  else
    echo "Apk not found: $apk"
  fi
done
echo "Done."