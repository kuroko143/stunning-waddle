#!/bin/bash

dnf5 -y copr enable avengemedia/dms
dnf5 -y copr enable avengemedia/danklinux

dnf5 -y install \
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
    https://kojipkgs.fedoraproject.org//packages/xwayland-satellite/0.8.1/1.fc44/x86_64/xwayland-satellite-0.8.1-1.fc44.x86_64.rpm

dnf5 -y copr disable avengemedia/dms
dnf5 -y copr disable avengemedia/danklinux

systemctl disable gdm.service
systemctl mask gdm.service
systemctl enable greetd.service
