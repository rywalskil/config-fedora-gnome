#!/usr/bin/env bash

# gsettings set org.gnome.desktop.interface text-scaling-factor 1.68
gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color '#606060'
gsettings set org.gnome.system.locale region 'fr_CH.UTF-8'
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.media-handling autorun-never true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.screensaver lock-delay 0
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 3600
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

sudo dnf autoremove -y cheese
sudo dnf autoremove -y gnome-contacts
sudo dnf autoremove -y libreoffice-*
sudo dnf autoremove -y gnome-maps
sudo dnf autoremove -y rhythmbox
sudo dnf autoremove -y gnome-weather
sudo dnf autoremove -y gnome-tour
sudo dnf autoremove -y gnome-boxes
sudo dnf update -y
sudo dnf install -y fedora-workstation-repositories

sudo dnf install -y jq
cd
mkdir .config/install-gnome-extensions/
cd .config/install-gnome-extensions/
rm -f ./install-gnome-extensions.sh; wget -N -q "https://raw.githubusercontent.com/cyfrost/install-gnome-extensions/master/install-gnome-extensions.sh" -O ./install-gnome-extensions.sh && chmod +x install-gnome-extensions.sh

./install-gnome-extensions.sh --enable --file extensionList

gsettings set org.gnome.shell.extensions.hidetopbar enable-active-window true
gsettings set org.gnome.shell.extensions.hidetopbar enable-intellihide true
gsettings set org.gnome.shell.extensions.hidetopbar mouse-sensitive true
gsettings set org.gnome.shell.extensions.hidetopbar mouse-sensitive-fullscreen-window false

gsettings set org.gnome.shell.extensions.unite autofocus-windows true
gsettings set org.gnome.shell.extensions.unite enable-titlebar-actions true
gsettings set org.gnome.shell.extensions.unite extend-left-box true
gsettings set org.gnome.shell.extensions.unite hide-activities-button 'always'
gsettings set org.gnome.shell.extensions.unite hide-window-titlebars 'always'
gsettings set org.gnome.shell.extensions.unite notifications-position 'right'
gsettings set org.gnome.shell.extensions.unite restrict-to-primary-screen false
gsettings set org.gnome.shell.extensions.unite show-legacy-tray true
gsettings set org.gnome.shell.extensions.unite show-window-buttons 'always'
gsettings set org.gnome.shell.extensions.unite show-window-title 'always'
gsettings set org.gnome.shell.extensions.unite use-system-fonts true
gsettings set org.gnome.shell.extensions.unite window-buttons-placement 'last'
gsettings set org.gnome.shell.extensions.unite window-buttons-theme 'default-dark'

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
hostnamectl set-hostname chiws21001.lafabrica.ch

gsettings set org.gnome.shell.extensions.net.gfxmonk.impatience speed-factor 0.0
gnome-extensions enable unite@hardpixel.eu
gnome-extensions enable hidetopbar@mathieu.bidon.ca
gnome-extensions enable impatience@gfxmonk.net

sudo dnf install -y tilix
gsettings set com.gexperts.Tilix.Settings enable-wide-handle false
gsettings set com.gexperts.Tilix.Settings focus-follow-mouse true
gsettings set com.gexperts.Tilix.Settings new-instance-mode 'new-session'
gsettings set com.gexperts.Tilix.Settings prompt-on-new-session true
gsettings set com.gexperts.Tilix.Settings sidebar-on-right true
gsettings set com.gexperts.Tilix.Settings terminal-title-show-when-single false
gsettings set com.gexperts.Tilix.Settings terminal-title-style 'none'
gsettings set com.gexperts.Tilix.Settings theme-variant 'light'
gsettings set com.gexperts.Tilix.Settings use-overlay-scrollbar true
gsettings set com.gexperts.Tilix.Settings use-tabs true
gsettings set com.gexperts.Tilix.Settings window-save-state false
gsettings set com.gexperts.Tilix.Settings window-style 'disable-csd-hide-toolbar'

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Alt>t'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'tilix --maximize'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'terminal full screen'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>e'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Open nautilus'

cd
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply rywalskil
sudo dnf install -y util-linux-user
sudo dnf install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
