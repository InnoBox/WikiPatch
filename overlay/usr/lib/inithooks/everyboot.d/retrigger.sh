#!/bin/sh
# This file is a terrifying hack designed to work around an apparent bug
# in udev or usbmount.  It appears that the "udevadm trigger" line in
# /etc/init.d/udev is not working.  This line should produce ACTION=="add"
# udev events for all USB devices that were plugged in before boot.
# Without these events, such devices (including the backup target drive)
# will never be mounted, so backups will not work.

# In this file we just run the command again.  For reasons that are entirely
# unknown, running it later in the boot sequence appears to work correctly
# and empirically, drives are now loaded as they should be.
echo "InnoBox retriggering udev to ensure loading of USB storage."
udevadm trigger
