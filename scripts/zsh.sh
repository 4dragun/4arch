#!/usr/bin/env bash

toilet="toilet -t --metal --font future"
ent="START..?"

echo OH-MY-ZSH | $toilet
read -p "$ent"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo POWERLEVEL10K | $toilet
read -p "$ent"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
wl-copy -n "powerlevel10k/powerlevel10k"
nvim ~/.zshrc
zsh
nvim ~/.p10k.zsh

echo ZSH-SYNTAX-HIGHLIGHTING | $toilet
read -p "$ent"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
wl-copy -n zsh-syntax-highlighting
nvim ~/.zshrc

echo ZSH-AUTOSUGGESTIONS | $toilet
read -p "$ent"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wl-copy -n zsh-autosuggestions
nvim ~/.zshrc
wl-copy -n completion
nvim ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

echo UWSM | $toilet
read -p "$ent"
wl-copy -n < ~/4end/scripts/scriptiles/uwsm.sh
nvim ~/.zshrc

echo SUCCESSFUL | $toilet
