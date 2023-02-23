# INFO
|Distribution|[Arch Linux](https://archlinux.org)
|:---:|:---:|
|Window Manager|[BSPWM](https://github.com/baskerville/bspwm) + [SXHKD](https://github.com/baskerville/sxhkd)
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)
|Shell|[Bash](https://www.gnu.org/software/bash)
|File Manager|[Ranger](https://github.com/ranger/ranger)
|System Info|[Neofetch](https://github.com/dylanaraps/neofetch)
|Editor|[NeoVim](https://neovim.io)
|Bar|[Polybar](https://github.com/polybar/polybar)
|Browser|[Firefox](https://www.mozilla.org/ru/firefox/new/)
|Messenger|[Telegram](https://telegram.org/)
|Applications Launcher|[Rofi](https://github.com/davatorium/rofi)
|Process Viewer|[Htop](https://htop.dev/)
|Wallpapers Manager|[Feh](https://github.com/derf/feh)
|Images Viewer|[Feh](https://github.com/derf/feh)
|Videos Viewer|[MPV](https://mpv.io/)
|Musics Viewer|[CMUS](https://github.com/cmus/cmus)
|Screenshots|NONE

# INSTALL
## Disk partitioning and instaling of the basic system
##### 1. Checking the disk
```sh
Command:
	lsblk -f
```

##### 2. Installing the GPT partition table:
```sh
Command:
	fdisk /dev/"Disk name"

Keys:
	d - Deleting a disks partition
	g - Instaling GPT partition
	w - Writing and exit the utility
```

##### 3. Splitting the disk into sections:
```sh
Command:
	cfdisk /dev/"Disk name"

Sections:
	1. 31MiB - BIOS Boot
	2. 300MiB -> 500MiB - EFI System
	3. The rest of the disk space - Linux File System
```

##### 4. Formating the disk partition:
```sh
Commands:
	mkfs.vfat /dev/"Second disk partition"
	mkfs.btrfs -f /dev/"Trids disk partition"
```

##### 5. Mounting partition:
```sh
Command:
	mount /dev/"Trids disk parition" /mnt
```

##### 6. Creating subvolumes:
```sh
Commands:
	btrfs su cr /mnt/@
	btrfs su cr /mnt/@home
	umount -R /mnt
```


## System pre-configuration
##### 1. Log in to the system:
```sh
Command:
	arch-chroot /mnt
```

##### 2. Settings the date and time:
```sh
Commands:
	ln -sf /usr/share/zoneinfo/Europe/"City of residence" /etc/localtime
	hwclock -w
```

##### 3. Localize the system:
```sh
Edit a file:
	nvim /etc/locale.gen	# Select the system languages, en_US.UTF-8 must be OPENED!

Comand:
	locale-gen
```

##### 4. We attribute the languages of the system:
```sh
Add a new file:
	nvim /etc/locale.conf:
		LANG=ru_RU.UTF-8	# Localization for Russian.
```

##### 5. Localizing the console:
```sh
Add a new file:
	nvim /etc/vconsole.conf:    # Localization for Russian.
		KEYMAP=ru
		FONT=cyr-sun16
```

##### 6. Setting the computer name:
```sh
Add a new file:
	nvim /etc/hostname:
		"Computer name"
```

##### 7. Editing a domain name file:
```sh
Add a new file:
	nvim /etc/hosts:
		127.0.0.1	localhost
		::1				localhost
		127.0.0.1	"Computer name".localdomain "Computer name"
```

##### 8. Creating a kernel image for RAM:
```sh
Command:
	mkinitcpio -P	# We use the -P key  if one kernel is installed in the system, otherwise -p "Desired kernel" (for example linus-zen).
```

##### 9. Setting the root password:
```sh
Command:
	passwd	# The password the enterrd, but not displayed.
```

##### 10. Instaling and configure the bootloader:
```sh
Commands:
	grub-install /dev/"Disk name"
	grub-mkconfig -o /boot/grub/grub.cfg
```

##### 11. Exit root and unmount /mnt directory:
```sh
Commands:
	exit
	umount -R /mnt
```

##### 12. Reboot into our system:
```sh
Command:
	poweroff

Action:
	We take out the bootbable USB flash drive.
```

## Basic system setup
##### 1. Setting up access to root rights:
```sh
Edit a file:
	nvim /etc/sudoers:
		%wheel ALL=ALL(ALL)	# Uncoment the line
```

##### 2. Creating a user:
```sh
Command:
	useradd -m -G wheel -s /bin/bash "Username"
	passwd "Username"	# The password must be DIFFERENT from the root user!
```

##### 3. We log out fron under root and go under our user:
```sh
Command:
	exit
```

##### 4. We uses root acces:
```sh
Command:
	sudo su
```

##### 5. Launching the NerworkMangager network service:
```sh
Command:
	systemctl enable NetworkManager
```

##### 6. Rebooting:
```sh
Command:
	reboot
```

##### 7. Connectin to the internet via WiFi:
```sh
Commands:
	sudo nmcli d wifi connect "WiFi Name" password "WiFi Password"
	ping archlinux.org -c2	# Checing the network connection.
```

##### 8. Opening the multilib repository:
```sh
Edit a file:
	sudo nvim /etc/pacman.conf:
		Uncoment the line:
			[multilib]
			Include = /etc/pacmanlist.d/mirrorlist
```

##### 9. Updating the reporitories and installing a set of packages for video acceleration:
```sh
Commands:
	Nvidia:
		sudo pacman -Syu nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulcan-icd-loader opencl-nvidia lib32-opencl-nvidia libxnvctrl
	Intel:
		sudo pacman -Syu lib32-mesa vulkan-intel lib32-vulkan-intel libva-intel-driver xf86-video-intel mesa-utils
```

##### 10. Rebooting:
```sh
Command:
	reboot
```

## Adding additional kernel modules for Nvidia graphics card and BTRFS
##### 1. Open the kernel configuration file:
```sh
Edit a file:
	sudo nvim /ect/mkinitcpio.conf:
		MODULES=():
			crc32c libcrc32c zlib_deflate btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm
```

##### 2. Reassembling Initramfs:
```sh
Command:
	sudo mkinitcpio -P	# We use the -P key  if one kernel is installed in the system, otherwise -p "Desired kernel" (for example linus-zen).
```

##### 3. Rebooting:
```sh
Command:
	reboot
```

## Arch Linux Optimization
##### 1. Download and assemble the yay package:
```sh
Commands:
    cd Downloads
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -sric
	cd
```

##### 2. Instaling the Nvidia Tweaks:
```sh
Commands:
	yay nvidia-tweaks
```

##### 3. Installing Ananicy:
```sh
Commands:
	yay ananicy
	sudo systemctl enable --new ananicy
```

##### 4. Instaling Haveged:
```sh
Commands:
	sudo pacman -S haveged
	sudo systemctl evable haveged
```

##### 5. Enabling the Trim service:
```sh
Command:
	sudo systemctl enable fstrim.timer
	sudo fstrim -v	# If it didn`t work, we use the -va key.
```


##### 6. Instaling Dbus-broker:
```sh
Commands:
	sudo pacman -S dbus-broker
	sudo systemctl enable --now dbus-broker.service
```

##### 7. Disabling NetworkManager-wait-online:
```sh
Commnad:
	sudo systemctl mask NetworkManager-wait-online.service
```

##### 8. System load optimization:
```sh
Edit a file:
	sudo nvim /etc/default/grub:
		GRUB_TIMEOUT=0
		GRUB_CMDLINE_LINUX_DEFAULT="":
			quiet loglevel=0 rd.systemd.show_status=auto splash rootfstype=btrfs selinux=0 lpj=[1] raid=noautodetect noibrs noibpb no_stf_barrier tsx=on tsx_async_abort=off elevator=noop mitigations=off preempt=none
		GRUB_TIMEOUT_STYLE=false

	## [1] - You can find out via: sudo dmesg | grep lpj=

Command:
	sudo grub-mkconfig -o /boot/grub/grub.cfg
```

##### 9. Rebooting:
```sh
Command:
	reboot
```

## Creating a backup of the system
##### 1. Install backup program:
```sh
Command:
	yay timmeshift
```

##### 2. Initializing the TimeShift in BTRFS mode:
```sh
Command:
	sudo timeshift --btrfs
```

##### 3. Creating the first backup:
```sh
Command:
	sudo timeshift --create --comments "The Main Arch Linux System"
```

