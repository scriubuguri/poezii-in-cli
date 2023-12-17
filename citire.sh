#!/bin/sh

PREVIEW_SIZE='right:75%'
find data -type f | fzf --height 90% --pointer='➤'  --preview 'less {}' --preview-window "$PREVIEW_SIZE" --bind 'enter:execute(less {})' --color 'fg:57,fg+:93,bg:234,preview-bg:232,border:201'



