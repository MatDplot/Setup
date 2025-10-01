sudo apt update
sudo apt install gnome-shell-extensions gnome-tweaks wget unzip
wget -O dash-to-panel.zip https://extensions.gnome.org/extension-data/dash-to-paneljderose9.github.com.v46.shell-extension.zip
mkdir -p ~/.local/share/gnome-shell/extensions
unzip dash-to-panel.zip -d ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com
gnome-extensions enable dash-to-panel@jderose9.github.com