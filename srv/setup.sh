#!/usr/bin/env sh
set -eu

PACK_URL="https://raw.githubusercontent.com/Sannity/teamgf-official-modpack/main/main/pack.toml"
PACKWIZ_INSTALLER_URL="https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar"

cd "$(dirname "$0")"

# Download packwiz-installer-bootstrap if it isn't downloaded yet
if [ ! -f "packwiz-installer-bootstrap.jar" ]; then
    echo "Downloading packwiz-installer-bootstrap.jar..."
    wget -qO packwiz-installer-bootstrap.jar "$PACKWIZ_INSTALLER_URL" || \
        curl -sLo packwiz-installer-bootstrap.jar "$PACKWIZ_INSTALLER_URL"
fi

# Sync mods from the packwiz pack (server side only)
echo "Syncing mods from the modpack..."
java -jar packwiz-installer-bootstrap.jar -g -s server "$PACK_URL"

# Accept EULA
echo "eula=true" > eula.txt