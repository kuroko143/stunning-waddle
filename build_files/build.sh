#!/bin/bash

set -ouex pipefail

cp -avf "/ctx/system_files"/. /

# sudo rpm-ostree kargs --replace="amdgpu.ppfeaturemask=0xFFF7FFFF=amdgpu.ppfeaturemask=0xffffffff" --append="bluetooth.disable_lpm=1"

dnf5 -y remove lutris waydroid

dnf5 -y install \
    alsa-plugins-a52.x86_64 \
    fastfetch \
    fuse-sshfs \
    i2c-tools \
    liquidctl \
    lm_sensors \
    openrgb-udev-rules \
    p7zip \
    p7zip-plugins \
    stow \
    unzip \
    usbutils \
    zip

SCRIPT_DIR="/ctx/scripts"
"$SCRIPT_DIR/00-amd.sh"
"$SCRIPT_DIR/01-docker.sh"
"$SCRIPT_DIR/02-nix.sh"
"$SCRIPT_DIR/03-vscode.sh"
"$SCRIPT_DIR/04-terminal.sh"
"$SCRIPT_DIR/05-niri.sh"

dnf5 -y install \
    ark \
    dolphin \
    kde-partitionmanager \
    kio-extras \
    mpv \
    qimgv

"$SCRIPT_DIR/98-bluetooth.sh"
"$SCRIPT_DIR/99-disable-usb-wake.sh"

firewall-offline-cmd --add-service=samba
