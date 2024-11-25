#!/bin/bash

cat <<EOL >> ~/.bashrc

# Custom Aliases
alias gitacp='git add . && git commit -m "$(read -p "Enter commit message: " message && echo $message)" && git push && git status'
alias setprompt="PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '"  

EOL

source ~/.bashrc

echo "Aliases added and .bashrc reloaded!"
