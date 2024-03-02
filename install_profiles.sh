#!/bin/bash

# Author: Barret E <https://github.com/archusXIV>

: "${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$XDG_CONFIG_HOME"/g810-led/{profiles,themes}
cp ./profiles/* "$XDG_CONFIG_HOME"/g810-led/profiles/
cp ./themes/* "$XDG_CONFIG_HOME"/g810-led/themes/

chmod +x ./scripts/g810_{create,delete,switch}_profile

sudo cp -f ./g810-led.rules /etc/udev/rules.d/
sudo mkdir -p /etc/g810-led/profiles
sudo cp -f ./profiles/* /etc/g810-led/profiles/
