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
	Command:
        lsblk -f
##### 2. Installing the GPT partition table:
	Command:
		fdisk /dev/"Disk name"

	Keys:
		d - Deleting a disks partition
		g - Instaling GPT partition
		w - Writing and exit the utility

##### 3. Splitting the disk into sections:
	Command:
		cfdisk /dev/"Disk name"

	Sections:
		1. 31MiB - BIOS Boot
		2. 300MiB -> 500MiB - EFI System
		3. The rest of the disk space - Linux File System

##### 4. Formating the disk partition:
	Commands:
		mkfs.vfat /dev/"Second disk partition"
		mkfs.btrfs -f /dev/"Trids disk partition"

##### 5. Mounting partition:
	Command:
		mount /dev/"Trids disk parition" /mnt

##### 6. Creating subvolumes:
	Commands:
		btrfs su cr /mnt/@
		btrfs su cr /mnt/@home
		umount -R /mnt

