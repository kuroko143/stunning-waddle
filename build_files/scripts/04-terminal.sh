#!/bin/bash

dnf5 -y copr enable atim/starship

dnf5 -y install \
    atuin \
    eza \
    kitty \
    neovim \
    starship

dnf5 -y copr disable atim/starship
