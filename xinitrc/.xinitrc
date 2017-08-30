#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --output VGA-1 --mode 1920x1080		# Set resolution 

# [Background]

# Uncomment to set static desktop background with feh script that points to background file.
# ~/.fehbg &

# Use gifview wrapped with xwinwrap to draw an animated file to the root window (desktop background). 
# You must use xwinwrap when using compton as it draws over the root window. 
# See https://github.com/chjj/compton/issues/226
xwinwrap -ov -fs -- gifview -w WID -a ~/wallpaper/rolly_rocket_resized.gif &

# [Programs]

numlockx &	# Set numlock key on 
xbanish &	# Hide mouse pointer when typing
mpd &		# Load mpd server
exec i3		# Execute i3-wm
