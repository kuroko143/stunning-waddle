#!/bin/bash

dnf5 -y copr enable alebastr/swayr

dnf5 -y install \
    sway \
    swayr \
    grim \
    slurp

dnf5 -y copr disable alebastr/swayr
