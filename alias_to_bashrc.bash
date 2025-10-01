#!/bin/bash

cat <<EOL >> ~/.bashrc

# Custom Aliases

alias gitacp='git add . && git commit -m "$(read -p "Enter commit message: " message && echo $message)" && git push && git status'
alias gitignore_update='git rm -r --cached . && git add . && git commit -m "Update .gitignore" && git push'


alias setprompt="PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '"  


alias cern='ssh mdubau@lxplus.cern.ch'
alias cern1='ssh -fNM mdubau@lxplus.cern.ch'
alias cern_check='ssh -O check lxplus.cern.ch'
alias cern_kill='ssh -O exit lxplus.cern.ch'
alias lxpswd='kinit -f mdubau@CERN.CH'
alias cern_y='ssh -Y mdubau@lxplus.cern.ch'
alias tunnelCERN="ssh  -L   34143:localhost:34143 mdubau@lxplus950.cern.ch" 


alias list_file='find . -type d -exec sh -c '\''echo -n "{}: "; find "{}" -type f | wc -l'\'' \;'
alias size='du -sh --block-size=G ./*'


function compile_slide() {
    local latex_file=$1
    mkdir -p ./out
    lualatex -file-line-error -interaction=nonstopmode -output-directory=./out/ "$latex_file.tex"
    biber ./out/"$latex_file"
    lualatex -file-line-error -interaction=nonstopmode -output-directory=./out/ "$latex_file.tex"
    lualatex -file-line-error -interaction=nonstopmode -output-directory=./out/ "$latex_file.tex"
}

function compile_latex() {
    local latex_file=$1
    mkdir -p ./out
    lualatex -file-line-error -interaction=nonstopmode -output-directory=./out "$latex_file.tex"
    biber ./out/"$latex_file"
    makeglossaries -d ./out "$latex_file"
    lualatex -file-line-error -interaction=nonstopmode -output-directory=./out "$latex_file.tex"
    lualatex -file-line-error -interaction=nonstopmode -output-directory=./out "$latex_file.tex"
}





EOL

source ~/.bashrc

echo "Aliases added and .bashrc reloaded!"
