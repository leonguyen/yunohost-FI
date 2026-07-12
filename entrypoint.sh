#!/bin/bash
set -e

# Symlink persistent paths if they exist on your mounted volume
mkdir -p /data/etc_yunohost /data/var_yunohost
if [ ! -d "/etc/yunohost" ]; then
    ln -s /data/etc_yunohost /etc/yunohost
fi

# Run the installation if YunoHost isn't detected
if [ ! -f "/usr/bin/yunohost" ]; then
    echo "==== Starting YunoHost Installation ===="
    # Download and run the official script natively with non-interactive flags
    curl https://install.yunohost.org | bash -s -- -a
fi

echo "==== Handing over control to Systemd ===="
exec /lib/systemd/systemd
