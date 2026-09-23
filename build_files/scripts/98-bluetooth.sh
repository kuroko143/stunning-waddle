#!/bin/bash

mkdir -p /etc/bluetooth
if [ -f /etc/bluetooth/main.conf ]; then
    sed -i 's/^#\?JustWorksRepairing.*/JustWorksRepairing = always/' /etc/bluetooth/main.conf
    sed -i 's/^#\?FastConnectable.*/FastConnectable = true/' /etc/bluetooth/main.conf
    sed -i 's/^#\?ControllerMode.*/ControllerMode = dual/' /etc/bluetooth/main.conf
else
    cat <<'EOF' > /etc/bluetooth/main.conf
[General]
JustWorksRepairing = always
ControllerMode = dual
FastConnectable = true
EOF
fi
