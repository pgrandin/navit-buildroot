#!/bin/sh

if ! grep -qE '^dtparam=audio=on' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
	echo "Adding 'dtparam=audio=on' to config.txt (enables audio)."
	cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# Enable audio
dtparam=audio=on
__EOF__
fi

if ! grep -qE '^disable_splash=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
	echo "Adding 'disable_splash=1' to config.txt (disables rainbow screen)."
	cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# Disables rainbow screen
disable_splash=1
__EOF__
fi

if ! grep -qE '^avoid_warnings=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
	echo "Adding 'avoid_warnings=1' to config.txt (disables rainbow square)."
	cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# Disables rainbow square
avoid_warnings=1
__EOF__
fi

echo "root=/dev/mmcblk0p2 rootwait logo.nologo console=null quiet console=tty2 vt.global_cursor_default=0" > ${BINARIES_DIR}/rpi-firmware/cmdline.txt

# [ -e ${TARGET_DIR}/lib/udev/gpsd.hotplug ] && rm ${TARGET_DIR}/lib/udev/gpsd.hotplug
