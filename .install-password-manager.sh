#!/bin/bash

# exit immediately if password-manager-binary is already in $PATH
type rbw >/dev/null 2>&1 && exit

# pacman based distros
if type pacman >/dev/null 2>&1; then
  sudo pacman -S rbw
# apt based distros
elif type apt >/dev/null 2>&1; then
  sudo apt install rbw
# dnf based distros
elif type dnf >/dev/null 2>&1; then
  sudo dnf install rbw

rbw config set email "ir.shoebottom@gmail.com"
rbw config set base_url "https://bitwarden.shoebottom.ca"
rbw login