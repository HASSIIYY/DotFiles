# Launching an SSH agent and adding an SSH key to it
eval "$(ssh-agent)"
ssh-add ~/.ssh/Archlinux

# Launching BSPWM
sxhkd -c /home/hassiiyy/.config/bspwm/sxhkdrc &
exec bspwm
