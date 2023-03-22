# Launching an SSH agent and adding an SSH key to it
eval "$(ssh-agent)" &
ssh-add ~/.ssh/ArchLinux &

# Start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Launching the Xresources file
[[ -f ~/.config/Xresources/Xresources ]] &&
	xrdb -merge -I$HOME ~/.config/Xresources/Xresources


# Launching BSPWM
sxhkd -c /home/hassiiyy/.config/bspwm/sxhkdrc &
exec bspwm
