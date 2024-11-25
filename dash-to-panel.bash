sudo apt update
sudo apt install git gnome-shell-extensions gnome-tweaks -y
git clone https://github.com/home-sweet-gnome/dash-to-panel.git
cd dash-to-panel
mkdir -p ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com
cp -r * ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com
gnome-extensions enable dash-to-panel@jderose9.github.com
cd ..

dconf load /org/gnome/shell/extensions/dash-to-panel/ < conf/dash-to-panel-settings.dconf

dconf load / < conf/gnome-settings-backup.dconf
