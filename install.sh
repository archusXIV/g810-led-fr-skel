#!/usr/bin/env bash

# Author: Barret E <https://github.com/archusXIV>

: "${XDG_CONFIG_HOME:-$HOME/.config}"

layout_dir=""
while true; do
    echo -e "\n Choose a keyboard layout:"
    echo -en "  1) French AZERTY\n  2) American QWERTY"
    read -rp " Selection [1/2]: " layout_choice
    case "$layout_choice" in
        1)
            layout_dir="$(dirname "$0")/skeletons/FR"
            break
        ;;
        2)
            layout_dir="$(dirname "$0")/skeletons/US"
            break
        ;;
        *)
            echo " Invalid choice. Please enter 1 or 2."
            sleep 2
            clear
            continue
        ;;
    esac
done

if [[ ! -d "$layout_dir" ]]; then
    echo " Selected layout directory not found: $layout_dir"
    exit 1
fi

mkdir -p "$XDG_CONFIG_HOME"/g810-led/{profiles,themes}
cp -f "$layout_dir"/keys_skel "$XDG_CONFIG_HOME"/g810-led/keys_skel
cp -f "$layout_dir"/groups_skel "$XDG_CONFIG_HOME"/g810-led/groups_skel
cp -f ./profiles/* "$XDG_CONFIG_HOME"/g810-led/profiles/
cp -f ./themes/* "$XDG_CONFIG_HOME"/g810-led/themes/

chmod +x ./scripts/g810_{create,delete,switch}_profile g810-led-menu

sudo cp -f ./g810-led.rules /etc/udev/rules.d/
sudo mkdir -p /etc/g810-led/profiles
sudo cp -f ./profiles/* /etc/g810-led/profiles/

printf '\n Installed layout skeletons for %s into %s\n' "$(basename "$layout_dir")" "$XDG_CONFIG_HOME/g810-led"
