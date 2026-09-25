#!/usr/bin/env bash
# Builds a release app and installs it on a connected iPhone.
#
#   tool/install_ios.sh [device-udid]
#
# Why this exists: the Release configuration is committed with manual signing
# and a `CI_PROFILE_NAME` placeholder, because that is what the GitHub Actions
# release workflow needs — it swaps the placeholder for the UUID of the
# provisioning profile it just installed. A local `flutter build ios --release`
# would look for a profile literally called CI_PROFILE_NAME and fail.
#
# So this swaps the Release block back to automatic development signing for
# the length of the build, then puts the file back exactly as it was — even if
# the build fails or you interrupt it.

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

PBXPROJ="ios/Runner.xcodeproj/project.pbxproj"

# Everything a local build rewrites behind your back. The pbxproj because we
# rewrite it ourselves below; the other two because a machine with
# `enable-swift-package-manager` on migrates the project away from CocoaPods
# the first time it builds, and CI — which has the flag off — needs the
# CocoaPods lockfile to stay true.
TOUCHED=(
  "$PBXPROJ"
  "ios/Podfile.lock"
  "ios/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme"
)

BACKUP_DIR="$(mktemp -d -t beenhere-ios)"

restore() {
  local i=0
  for file in "${TOUCHED[@]}"; do
    [[ -f "$BACKUP_DIR/$i" ]] && cp "$BACKUP_DIR/$i" "$file"
    i=$((i + 1))
  done
  rm -rf "$BACKUP_DIR"
  echo "▶  ios/ project files restored (CI placeholder back in place)"
}
trap restore EXIT

i=0
for file in "${TOUCHED[@]}"; do
  cp "$file" "$BACKUP_DIR/$i"
  i=$((i + 1))
done

python3 - "$PBXPROJ" <<'PY'
import re, sys

path = sys.argv[1]
with open(path) as f:
    content = f.read()

# Only the Release block, and only the three keys CI cares about.
content = content.replace(
    'CODE_SIGN_IDENTITY = "Apple Distribution";',
    'CODE_SIGN_IDENTITY = "Apple Development";',
)
content = content.replace('CODE_SIGN_STYLE = Manual;', 'CODE_SIGN_STYLE = Automatic;')
content = re.sub(
    r'PROVISIONING_PROFILE_SPECIFIER = "?CI_PROFILE_NAME"?;',
    'PROVISIONING_PROFILE_SPECIFIER = "";',
    content,
)

with open(path, 'w') as f:
    f.write(content)
print('▶  signing switched to automatic for this build')
PY

flutter build ios --release

DEVICE="${1:-}"
if [[ -z "$DEVICE" ]]; then
  DEVICE=$(xcrun devicectl list devices 2>/dev/null \
    | awk '/iPhone/ && /available/ {print $3; exit}')
fi

if [[ -z "$DEVICE" ]]; then
  echo "⚠️   No available iPhone found. Pass a UDID:  tool/install_ios.sh <udid>"
  echo "    (xcrun devicectl list devices)"
  exit 1
fi

echo "▶  installing on $DEVICE"
xcrun devicectl device install app --device "$DEVICE" build/ios/iphoneos/Runner.app
