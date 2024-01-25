#!/bin/sh

preview_size=$(($(tput cols) * 40 / 100))

find data -type f | sed 's|^data/||' | fzf --height 100% --pointer='➤' --preview 'less data/{}' --preview-window "$preview_size" --bind 'enter:execute(less data/{})' --color 'fg:57,fg+:93,bg:234,preview-bg:232,border:201'
