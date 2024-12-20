#!/bin/bash

sudo apt update
sudo apt install wget
sudo apt install curl

sudo apt install snapd
sudo systemctl enable --now snapd.socket
sudo systemctl start snapd


cd ~
mkdir App
cd App/



#Tunderbird
# https://support.mozilla.org/fr/kb/installer-thunderbird-sous-linux
echo "Thunderbird"
yes | sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
yes | sudo flatpak install flathub org.mozilla.Thunderbird



#Chrome
# https://doc.ubuntu-fr.org/google_chrome
echo "Chrome"
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -O- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo tee /etc/apt/trusted.gpg.d/linux_signing_key.pub
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78BD65473CB3BD13
sudo apt-key export D38B4796 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/chrome.gpg
sudo apt update
sudo apt-get install google-chrome-stable



#VSCode
echo "VSCode"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code



#Spotify
# https://www.spotify.com/fr/download/linux/
echo "Spotify"
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt-get install spotify-client



#Zoom
echo "Zoom"
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb
sudo apt update
yes | sudo apt --fix-broken install



#Zotero
# https://github.com/retorquere/zotero-deb
echo "Zotero"
wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
sudo apt update
yes | sudo apt install zotero



#KeepassXC
# https://doc.ubuntu-fr.org/keepassxc
echo "KeepassXC"
yes | sudo apt install keepassxc



#Mattermost
echo "Mattermost"
curl -fsS -o- https://deb.packages.mattermost.com/setup-repo.sh | sudo bash
sudo apt update
sudo apt install mattermost-desktop



#python
echo "Python"
yes | sudo apt install python3 python3-pip
pip3 install --break-system-packages matplotlib numpy pandas scikit-learn tensorflow keras h5py
pip3 install --break-system-packages jupyterlab notebook
yes | sudo apt install hdf5-tools



#Root
echo "Root"
sudo snap install root-framework


echo "Thunderbird"
yes | sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
yes | sudo flatpak install flathub org.mozilla.Thunderbird


#LibreOffice
echo "LibreOffice"
yes | sudo apt install libreoffice



#Latex
echo "Latex"
yes | sudo apt install texlive-full



sudo apt-get clean
sudo apt-get autoremove