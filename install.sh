#!/bin/sh

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#

###### Update package lists
apt update

###### Install main apps, drivers and dependencies
apt install -y ubuntu-drivers-common
apt install -y ubuntu-restricted-extras
apt install -y ttf-ubuntu-font-family
apt install -y openssh-client curl gcc g++
apt install -y libstartup-notification0
apt install -y evince evince-common lightdm make autoconf automake
apt install -y x11-xserver-utils arandr
apt install -y pavucontrol dconf-tools
apt install -y python-gconf lxappearance
apt install -y policykit-desktop-privileges
apt install -y policykit-1-gnome vim thunar
apt install -y gnome-system-monitor gnome-system-tools
apt install -y network-manager wireless-tools
apt install -y lightdm-gtk-greeter lightdm-gtk-greeter-settings
apt install -y overlay-scrollbar overlay-scrollbar-gtk2
apt install -y pulseaudio-module-x11
apt install -y totem-plugins gromit gstreamer1.0-pulseaudio
apt install -y transmission-gtk pulseaudio-utils xbacklight
apt install -y feh rofi compton gnome-terminal
apt install -y i3 i3-wm i3blocks i3lock i3status
apt install -y xserver-xorg-video-intel
apt install -y acpi-support apport-gtk foomatic-db-compressed-ppds
apt install -y hplip
apt install -y evince evince-common libssh-4 libnm-glib-vpn1
apt install -y fonts-arphic-ukai fonts-arphic-uming
apt install -y fonts-dejavu-core fonts-freefont-ttf
apt install -y fonts-guru fonts-guru-extra fonts-kacst
apt install -y fonts-kacst-one fonts-khmeros-core
apt install -y fonts-liberation fonts-opensymbol
apt install -y fonts-nanum fonts-stix fonts-symbola
apt install -y xfonts-base xfonts-encodings
apt install -y xfonts-scalable xfonts-utils
apt install -y libfont-afm-perl
apt install -y libfontconfig1 libfontembed1
apt install -y libfontenc1
apt install -y fontconfig fontconfig-config
apt install -y dmz-cursor-theme libwayland-cursor0
apt install -y libxcursor1 xcursor-themes
apt install -y mousetweaks laptop-detect
apt install -y update-inetd update-notifier update-notifier-common
apt install -y usb-creator-common usb-creator-gtk
apt install -y gnome-power-manager
apt install -y libgsettings-qt1 libproxy1-plugin-gsettings
apt install -y libappindicator3-1 gir1.2-appindicator3-0.1 gdebi
snap install vscode --classic
snap install dotnet-sdk --classic
apt install -y zsh htop tmux

###### Get and install playerctl
curl -L -o pc.deb 'https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb'
dpkg -i pc.deb
rm -f pc.deb

###### Get and install Chrome
curl -L -o ch.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
dpkg -i ch.deb
rm -f ch.deb

###### Make .fonts directory if not already available
mkdir ~/.fonts

###### Get and install San Francisco Font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf ~/.fonts
rm -rf YosemiteSanFranciscoFont

###### Get and install Font Awesome Web Font
git clone https://github.com/FortAwesome/Font-Awesome.git
cp -v Font-Awesome/fonts/*.ttf ~/.fonts
rm -rf Font-Awesome

###### Get and install infinality (better font rendering)
curl -L -o ifnly.deb https://launchpadlibrarian.net/127644673/fontconfig-infinality_20130104-0ubuntu0ppa1_all.deb
dpkg -i ifnly.deb
rm -f ifnly.deb
/etc/fonts/infinality/infctl.sh setstyle

###### Make config directories
mkdir ~/.config
mkdir ~/.config/gtk-3.0
mkdir ~/.config/i3

###### Set configs
#cp -f configs/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp -f configs/i3/config ~/.config/i3/config

###### Install Oh-my-zsh
curl -o omz.sh https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
chmod +x omz.sh
./omz.sh
rm -f omz.sh

###### Remove bloatware
apt remove -y firefox
apt remove -y gnome-keyring
apt remove -y gnome-bluetooth
apt remove -y gnome-accessibility-themes
apt remove -y gnome-user-docs
apt remove -y gnome-user-guide
apt remove -y gnome-disk-utility
apt remove -y gnome-software
snap remove gnome-calculator
snap remove gnome-system-monitor
snap remove gnome-characters
