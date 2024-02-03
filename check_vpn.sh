#!/bin/bash

VPN_NAME="AU-VPN"
SHARE_KEY="uni.au.dk"
VPN_ACTIVE=$(nmcli con show --active | grep $VPN_NAME)

unmount_au_share() {
	MOUNTED_SAMBA_SHARES=$(mount -t cifs | grep "$SHARE_KEY")
	if [ -n "$MOUNTED_SAMBA_SHARES" ]; then
		MOUNT_POINT=$(echo "$MOUNTED_SAMBA_SHARES" | awk '{print $3}')
		sudo umount -lf "$MOUNT_POINT"
		echo "Unmounted '$MOUNT_POINT'"
	else
		echo "The share is not mounted, no need to unmount."
	fi
}

if [ -z "$VPN_ACTIVE" ]; then
	echo "VPN '$VPN_NAME' is not active."
	unmount_au_share
else
	echo "VPN '$VPN_NAME' is active, no need for unmount."
fi
