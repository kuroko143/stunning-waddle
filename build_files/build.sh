#!/bin/bash

set -ouex pipefail

cp -avf "/ctx/system_files"/. /

# sudo rpm-ostree kargs --append="amdgpu.ppfeaturemask=0xffffffff" --append="bluetooth.disable_lpm=1"

dnf5 -y remove lutris waydroid

SCRIPT_DIR="/ctx/scripts"
"$SCRIPT_DIR/01-docker.sh"
"$SCRIPT_DIR/02-nix.sh"
"$SCRIPT_DIR/03-vscode.sh"

dnf5 -y copr enable avengemedia/dms
dnf5 -y copr enable avengemedia/danklinux
dnf5 -y copr enable ilyaz/LACT
dnf5 -y copr enable atim/starship

dnf5 -y install --enablerepo=docker-ce-stable,code \
    containerd.io \
    docker-buildx-plugin \
    docker-ce \
    docker-ce-cli \
    docker-compose-plugin \
    docker-model-plugin \
    busybox \
    nix \
    nix-daemon \
    nix-legacy \
    code \
    lact \
    atuin \
    eza \
    kitty \
    neovim \
    starship \
    blueman \
    dms \
    dms-greeter \
    fuzzel \
    greetd \
    greetd-selinux \
    kvantum \
    niri \
    pavucontrol \
    playerctl \
    qt6-qtmultimedia \
    qt6ct \
    xdg-desktop-portal \
    xdg-desktop-portal-gnome \
    xdg-desktop-portal-gtk \
    https://kojipkgs.fedoraproject.org//packages/xwayland-satellite/0.8.1/1.fc44/x86_64/xwayland-satellite-0.8.1-1.fc44.x86_64.rpm \
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
    zip \
    ark \
    dolphin \
    kde-partitionmanager \
    kio-extras \
    mpv \
    qimgv

"$SCRIPT_DIR/98-bluetooth.sh"
"$SCRIPT_DIR/99-disable-usb-wake.sh"

dnf5 -y copr disable avengemedia/dms
dnf5 -y copr disable avengemedia/danklinux
dnf5 -y copr disable ilyaz/LACT
dnf5 -y copr disable atim/starship

systemctl enable docker.service docker.socket podman.socket
systemctl enable nix.mount nix-daemon
systemctl enable lactd

systemctl disable gdm.service
systemctl mask gdm.service
systemctl enable greetd.service

firewall-offline-cmd --add-service=samba
