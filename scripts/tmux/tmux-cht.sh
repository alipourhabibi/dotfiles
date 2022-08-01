#!/usr/bin/env bash
commads=~/.tmux/command-search
language=~/.tmux/language-search
selected=`cat $commads $language | fzf `
if [[ -z $selected ]]; then
	exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" "$language"; then
	tmux neww bash -c "curl -s cht.sh/$selected/$query | less"
else
	tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
