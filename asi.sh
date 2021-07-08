#! /bin/bash

reflector --verbose --country 'RU' -l 10 -p https --sort rate --save /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware amd-ucode sudo vim btrfs-progs
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Yekaterinburg /etc/localtime

vim /etc/locale.gen
echo 'LANG=ru_RU.UTF-8' >> /etc/locale.conf
echo 'KEYMAP=ru' >> /etc/vconsole.cfg
echo 'FONT=cyr-sun16' >> /etc/vconsole.cfg

echo 'vArch' >> /etc/hostname
echo '127.0.0.1 localhost' >> /etc/hosts
echo '::1 localhost' >> /etc/hosts
echo '127.0.1.1 vArch.localdomain vArch' >> /etc/hosts

pacman -S networkmanager
systemctl enable NetworkManager

passwd

useradd -m -g users -G wheel -s /bin/bash vAE
