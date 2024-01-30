#!/bin/bash

# Check root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Install fzf if it is not installed
if [ ! -f /usr/bin/fzf ]; then
  if [ -f /usr/bin/apt ]; then
    PM="apt"
    PM_install="install"
    PM_package="fzf"
  elif [ -f /usr/bin/dnf ]; then
    PM="dnf"
    PM_install="install"
    PM_package="fzf"
  elif [ -f /usr/bin/pacman ]; then
    PM="pacman"
    PM_install="-S"
    PM_package="fzf"
  elif [ -f /usr/bin/apk ]; then
    PM="apk"  
    PM_install="add"
    PM_package="fzf"
  else
    echo "Package manager not found"
    exit 
  fi
  
  # Install fzf
  "$PM" "$PM_install" "$PM_package"
  exit 1
fi
