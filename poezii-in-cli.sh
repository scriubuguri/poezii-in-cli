#!/bin/sh
#create datadir var 
#if /usr/share/poezii-in-cli/data doesn't exist set it to data
#if it exist set to share/poezii-in-cli/data
if [ ! -d "/usr/share/poezii-in-cli/data" ]; then
	datadir="data"
else
	datadir="/usr/share/poezii-in-cli/data"
fi


preview_size="right:37%"

find $datadir -type f | sed 's|^'$datadir'/||' | fzf --height 100% --pointer='➤' --preview 'less '$datadir'/{}' --preview-window "$preview_size" --bind 'enter:execute(less '$datadir'/{})' --color 'fg:#ffc0cb,fg+:201,bg:234,preview-bg:#010203,border:201'
