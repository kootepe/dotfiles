#!/bin/dash

# fix blank java apps
export _JAVA_AWT_WM_NONREPARENTING=1

# ask QT to use Wayland
export QT_QPA_PLATFORM=wayland

# ask Firefox to use Wayland
# export MOZ_ENABLE_WAYLAND=1
# export MOZ_WEBRENDER=1

# set XDG vars for apps that might need it
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

# fix some gtk apps launching slow
# export GTK_USE_PORTAL=0

# keyring daemon for secrets
# eval $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh | sed 's/^\(.*\)/export \1/g')

# finally, launch sway
/usr/bin/sway
