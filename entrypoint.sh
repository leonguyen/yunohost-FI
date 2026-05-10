#!/bin/bash
set -e

mkdir -p /run/dbus

exec /sbin/init
