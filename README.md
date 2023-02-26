# INFO
|Type|Name|Configuration|
|:---:|:---:|:---:|
|Distribution|[Arch Linux](https://archlinux.org)|Added|
|Window Manager|[BSPWM](https://github.com/baskerville/bspwm) + [SXHKD](https://github.com/baskerville/sxhkd)|Added|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|Added|
|Shell|[Bash](https://www.gnu.org/software/bash)|:x:|
|File Manager|[Ranger](https://github.com/ranger/ranger)|Added|
|System Info|[Neofetch](https://github.com/dylanaraps/neofetch)|Added|
|Editor|[NeoVim](https://neovim.io)|Absent|
|Bar|[Polybar](https://github.com/polybar/polybar)|
|Browser|[Firefox](https://www.mozilla.org/ru/firefox/new/)|Added|
|Messenger|[Telegram](https://telegram.org/)|Absent|
|Applications Launcher|[Rofi](https://github.com/davatorium/rofi)|Added|
|Process Viewer|[Htop](https://htop.dev/)|Added|
|Wallpapers Manager|[Feh](https://github.com/derf/feh)|Added|
|Images Viewer|[Feh](https://github.com/derf/feh)|Added|
|Videos Viewer|[MPV](https://mpv.io/)|Absent|
|Musics Viewer|[CMUS](https://github.com/cmus/cmus)|Absent|
|Screenshots|NONE|

# INSTALL
## Disk partitioning and instaling of the basic system
##### 1. Checking the disk
```sh
Command:
	lsblk -f
```
##### 2. Installing the GPT partition table
```sh
Command:
	fdisk /dev/"Disk name"

Keys:
	d - Deleting a disks partition
	g - Instaling GPT partition
	w - Writing and exit the utility
```

##### 3. Splitting the disk into sections
```sh
Command:
	cfdisk /dev/"Disk name"

Sections:
	1. 31MiB - BIOS Boot
	2. 300MiB <-> 500MiB - EFI System
	3. 4GiB <-> 8GiB - Linux SWAP
	3. The rest of the disk space - Linux File System
```

##### 4. Formating the disk partition
```sh
Commands:
	mkfs.vfat /dev/"Second disk partition"
	mkswap /dev/"Third disk partition"
	mkfs.btrfs -f /dev/"Fourth disk partition"
```

##### 5. Mounting partition
```sh
Command:
	mount /dev/"Fourth disk parition" /mnt
```

##### 6. Creating subvolumes
```sh
Commands:
	btrfs su cr /mnt/@
	btrfs su cr /mnt/@home
	umount -R /mnt
```

##### 7. Mount the subvolumes and partitions
```sh
Commands:
	mount -o rw,noatime,nodatacow,max_inline=256,compress=zstd:3,ssd,ssd_spread,discard=async,space_cache=v2,commit=120,subvol=/@ /dev/"Fourth disk partition" /mnt

	mkdir /mnt/home
	mount -o rw,noatime,nodatacow,max_inline=256,compress=zstd:3,ssd,ssd_spread,discard=async,space_cache=v2,commit=120,subvol=@home /dev/"Fourth disk partition" /mnt/home


	mkdir /mnt/boot
	mkdir /mnt/boot/EFI
	mount /dev/"Second disk partition" /mnt/boot/EFI
```

##### 8. Mounting an additional disk partition
> __ATTENTION!: The implementation of this paragraph is not necessary.__ <br/>
> My system uses an additional disk for user files and installation of games, so I mount two more partitions.

```sh
Commands:
	mkdir /mnt/home/"Username"
	mkdir /mnt/home/.Instalations
	mount -o rw,max_inline=256,noatime,compress=zstd:3,discard=async,space_cache=v2,commit=120,subvol=/ /dev/"Additional disk partition" /mnt/home/"Username"
	mount -o rw,max_inline=256,noatime,compress=zstd:3,discard=async,space_cache=v2,commit=120,subvol=/ /dev/"Additional disk partition" /mnt/home/.Instalations
```

##### 8. Connecting to WiFi
```sh
Command:
	iwctl:
	    station "ip a - devices" connect "WiFi name"
	    ping archlinux.org -c2  # Checing the network connection
```

##### 9. Installing the basic system
```sh
Commands:
	pacman -Sy archlinux-keyring
	pacstrap -i /mnt base base-devel linux-zen linux-zen-headers linux-firmware dosfstools btrfs-progs intel-ucode iucode-tool grub efibootmgr dhcpcd dhclient networkmanager network-manager-applet alsa-lib alsa-lib-devel alsa-plugins alsa-tools alsa-utils git neovim
```

##### 10. Creating a file system configuration file
```sh
Commands:
	genfstab -U /mnt >> /mnt/etc/fstab
	vim /mnt/etc/fstab
```


## System pre-configuration
##### 1. Log in to the system
```sh
Command:
	arch-chroot /mnt
```

##### 2. Settings the date and time
```sh
Commands:
	ln -sf /usr/share/zoneinfo/Europe/"City of residence" /etc/localtime
	hwclock -w
```

##### 3. Localize the system
```sh
Edit a file:
	nvim /etc/locale.gen	# Select the system languages, en_US.UTF-8 must be OPENED!

Comand:
	locale-gen
```

##### 4. We attribute the languages of the system
```sh
Add a new file:
	nvim /etc/locale.conf:
		LANG=ru_RU.UTF-8	# Localization for Russian.
```

##### 5. Localizing the console
```sh
Add a new file:
	nvim /etc/vconsole.conf:    # Localization for Russian.
		KEYMAP=ru
		FONT=cyr-sun16
```

##### 6. Setting the computer name
```sh
Add a new file:
	nvim /etc/hostname:
		"Computer name"
```

##### 7. Editing a domain name file
```sh
Add a new file:
	nvim /etc/hosts:
		127.0.0.1	localhost
		::1		localhost
		127.0.0.1	"Computer name".localdomain "Computer name"
```

##### 8. Creating a kernel image for RAM
```sh
Command:
	mkinitcpio -P	# We use the -P key  if one kernel is installed in the system, otherwise -p "Desired kernel" (for example linus-zen).
```

##### 9. Setting the root password
```sh
Command:
	passwd	# The password the enterrd, but not displayed.
```

##### 10. Instaling and configure the bootloader
```sh
Commands:
	grub-install /dev/"Disk name"
	grub-mkconfig -o /boot/grub/grub.cfg
```

##### 11. Exit root and unmount /mnt directory
```sh
Commands:
	exit
	umount -R /mnt
```

##### 12. Reboot into our system
```sh
Command:
	poweroff

Action:
	We take out the bootbable USB flash drive.
```


## Basic system setup
##### 1. Setting up access to root rights
```sh
Edit a file:
	nvim /etc/sudoers:
		%wheel ALL=ALL(ALL)	# Uncoment the line
```

##### 2. Creating a user
```sh
Command:
	useradd -m -G wheel -s /bin/bash "Username"
	passwd "Username"	# The password must be DIFFERENT from the root user!
```

##### 3. We log out fron under root and go under our user
```sh
Command:
	exit
```

##### 4. We uses root acces
```sh
Command:
	sudo su
```

##### 5. Launching the NerworkMangager network service
```sh
Command:
	systemctl enable NetworkManager
```

##### 6. Rebooting
```sh
Command:
	reboot
```

##### 7. Connectin to the internet via WiFi
```sh
Commands:
	sudo nmcli d wifi connect "WiFi Name" password "WiFi Password"
	ping archlinux.org -c2	# Checing the network connection.
```

##### 8. Opening the multilib repository
```sh
Edit a file:
	sudo nvim /etc/pacman.conf:
		Uncoment the line:
			[multilib]
			Include = /etc/pacmanlist.d/mirrorlist
```

##### 9. Updating the reporitories and installing a set of packages for video acceleration
```sh
Commands:
	Nvidia:
		sudo pacman -Syu nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulcan-icd-loader opencl-nvidia lib32-opencl-nvidia libxnvctrl
	Intel:
		sudo pacman -Syu lib32-mesa vulkan-intel lib32-vulkan-intel libva-intel-driver xf86-video-intel mesa-utils
```

##### 10. Rebooting
```sh
Command:
	reboot
```


## Adding additional kernel modules for Nvidia graphics card and BTRFS
##### 1. Open the kernel configuration file
```sh
Edit a file:
	sudo nvim /ect/mkinitcpio.conf:
		MODULES=():
			crc32c libcrc32c zlib_deflate btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm
```

##### 2. Reassembling Initramfs
```sh
Command:
	sudo mkinitcpio -P	# We use the -P key  if one kernel is installed in the system, otherwise -p "Desired kernel" (for example linus-zen).
```

##### 3. Rebooting
```sh
Command:
	reboot
```


## Arch Linux Optimization
##### 1. Download and assemble the yay package
```sh
Commands:
	cd Downloads
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -sric
	cd
```

##### 2. Instaling the Nvidia Tweaks
```sh
Commands:
	yay nvidia-tweaks
```

##### 3. Installing Ananicy
```sh
Commands:
	yay ananicy
	sudo systemctl enable ananicy
```

##### 4. Instaling Haveged
```sh
Commands:
	sudo pacman -S haveged
	sudo systemctl evable haveged
```

##### 5. Enabling the Trim service
```sh
Command:
	sudo systemctl enable fstrim.timer
	sudo fstrim -v	# If it didn`t work, we use the -va key.
```


##### 6. Instaling Dbus-broker
```sh
Commands:
	sudo pacman -S dbus-broker
	sudo systemctl enable dbus-broker.service
```

##### 7. Disabling NetworkManager-wait-online
```sh
Commnad:
	sudo systemctl mask NetworkManager-wait-online.service
```

##### 8. System load optimization
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

##### 9. Rebooting
```sh
Command:
	reboot
```


## Creating a backup of the system
##### 1. Install backup program
```sh
Command:
	yay timmeshift
```

##### 2. Initializing the TimeShift in BTRFS mode
```sh
Command:
	sudo timeshift --btrfs
```

##### 3. Creating the first backup
```sh
Command:
	sudo timeshift --create --comments "The Main Arch Linux System"
```


## Installing BSPWM
##### 1. Installing BSPWM and its dependencies:
```sh
Command:
    sudo pacman -Sy bspwm sxhkd xorg-server xorg-xinit xorg-xrandr picom nvidia-prime
```

##### 2. Installing bluetooth modules:
```sh
Commands:
    sudo pacman -Sy bluez bluez-utils
	sudo systemctl enable bluetooth
```

##### 3. Installing Fonts:
```sh
Command:
    sudo pacman -Sy ttf-font-awesome ttf-ubuntu-font-family ttf-jetbrains-mono-nerd
```
##### 4. Installing the Sound System Assistant:
```sh
CommandS:
    sudo pacman -Sy pulseaudio pulseaudio-alsa pulseaudio-bluetooth
	yay -S pulseaudio-control
```

##### 5. Installing programs:
```sh
Command:
	sudo pacman -S alacritty ranger rofi polybar neofetch htop unzip cmus feh mpv firefox telegram-desktop
```

##### 6. Installing program dependencies:
```sh
Command:
    sudo pacman -Sy wmctrl pacman-contrib xclip acpilight xf86-input-synaptics python-pip ueberzug fmpegthumbnailer
```

##### 7. Installing Printer Drivers:
```sh
Commands:
	sudo pacman -S cups cups-pdf simple-scan
	sudo systemctl enable cups
	yay pantum  # ATTENTION!: My printer is a Pantum brand, so I'm installing a driver for this brand, you probably have a different brand.
```


## Configuring BSPWM
##### 1. Adding environment variables:
```sh
Edit a file:
	sudo nvim /etc/environment:
		VISUAL=nvim     # We indicate to the system that we use NeoVim as the main code editor
```

##### 2. Adding a user to groups:
```sh
Command:
	sudo usermod -aG ftp,http,mail,audio,disk,input,scanner,storage,video "Username"
	groups "Username"   # We check the groups to which our user has been added
```

##### 3. Creating links to folders from additional disk partitions
> __ATTENTION!: The implementation of this paragraph is not necessary.__ <br/>
> My system uses an additional disk for user files and installing games, so I create links to user folders such as Documents, Downloads and others.

```sh
Commands:
    ln -sf /run/media/HardDisk/"Folder_Name" /home/"UserName"/"FolderName"
```

##### 4. Changing the owner of folders and files
```sh
Commands:
    # Since these folders were created from under the Root user, they and all attached files and folders belong to him
    sudo chown "UserNamr":"UserName" -R /home/"Username"
    sudo chown "UserName":"UserName" -R /home/.Instalations
```

##### 5. Copy the Xorg configuration files:
> __ATTENTION!__ <br/>
> Instead of a colon, paste the path to the cloned DotFiles folder, or to the one where you copied the repository files

```sh
Commands:
	sudo cp .../DotFiles/Misc/00-keyboard.conf /etc/X11/xorg.conf.d		# The keyboard settings file. I have English and Russian layouts installed, as well as switching them by clicking on CapsLock
	sudo cp .../DotFiles/Misc/70-synaptics.conf /etc/X11/xorg.conf.d 	# Touchpad settings file for laptops
	sudo cp .../DotFiles/Misc/.xinitrc /home/"UserName"/.xinitrc	    	# Xorg Startup file
```

##### 6. Copy the cursor icon theme:
> __ATTENTION!__ <br/>
> Instead of a colon, paste the path to the cloned DotFiles folder, or to the one where you copied the repository files

```sh
Command:
	sudo cp -r .../DotFiles/Misc/"Icon Themes" /usr/share/icons/

Edit a file:
	sudo nvim /usr/share/icons/default/index.theme:
		Inherits="Icon Theme"
```

##### 7. Disabling unnecessary application icons:
> __ATTENTION!__ <br/>
> For some applications I edit __.desktop__ files, for more convenient interaction in the Rofi menu. <br/>
> For example, I change the name of some applications or add the item NoDisplay=true to disable the display of this application in the menu.

```sh
Edit Files:
	sudo ranger:
		/usr/share/applications/*.desktop
```

##### 8. Rebooting
```sh
Command:
	sudo reboot
```

##### 9. Log in to BSPWM:
```sh
Command:
	startx
```

##### 10. Adding a printer to the system:
```sh
Web interface:
	http://localhost:631/
```

##### 11. Autologin and Autostart Xorg via Systemd:
> __ATTENTION!__ <br/>
> Instead of a colon, paste the path to the cloned DotFiles folder, or to the one where you copied the repository files.

```sh
Command:
	sudo cp .../DotFiles/Misc/x11-autologin.service /etc/systemd/system
	sudo systemctl enable x11-autologin
```

## Configuring SSH Keys
##### 1. Creating an SSH key
```sh
Commands:
    mkdir ~/.ssh && cd ~/.ssh
    ssh-keygen  # At this stage, you can choose an arbitrary name for your SSH key
```

##### 2. Adding an SSH key to a GitHub account
```sh
Command:
    cat ~/.ssh/"Key_Name"   # At this stage we need to read the private key (without extension.pub)

Action:
    GitHub.com > Settings > SSH and GPG keys > New SSH key
```

##### 3. Adding a Git Account
```sh
Commands:
    git config --global user.name "UserName"
    git config --global user.email "Email@example.com"
```

## Installing add-ons for files and programs
#### Configuring NeoVim
##### 1. Integrating Vim-Plug:
```sh
Command:
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

##### 2. Installing Vim Plugins:
```sh
Command:
	:PlugInstall	# Apply the command in the editor.
```
