#!/bin/bash

cat <<'EOF' > /etc/systemd/system/disable-wakeup.service
[Unit]
Description=Disable USB ACPI wakeup triggers

[Service]
Type=oneshot
ExecStart=/bin/sh -c "for dev in XHC0 PTXH; do if grep -q \"$dev.*enabled\" /proc/acpi/wakeup; then echo $dev > /proc/acpi/wakeup; fi; done"
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl enable disable-wakeup.service
