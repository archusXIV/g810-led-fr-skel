# g810-led profile skeletons for Linux
Create, delete or switch g810-led profiles for Logitech keyboards using layout-specific skeletons.

This project originally targeted French AZERTY keyboards, and it now also includes a US QWERTY variant. The layout files are kept separate so the color logic stays consistent while the key names and layout mapping change.

Youtube [video](https://www.youtube.com/watch?v=sfBx5aLTEFM), french spoken.

Profiles depend on a layout skeleton file, which you can edit before installation. The keys are organized by rows and grouped to match the underlying g810-led key mapping. The project keeps the same color assignment scheme across layouts; only the physical key names are remapped.

A matching group skeleton is also provided.

## Layout variants
- French AZERTY: [skeletons/FR/profile_skel](skeletons/FR/profile_skel), [skeletons/FR/group_skel](skeletons/FR/group_skel)
- US QWERTY: [skeletons/US/profile_skel](skeletons/US/profile_skel), [skeletons/US/group_skel](skeletons/US/group_skel)

The generated profiles live under [profiles](profiles) and can be customized with your own palette values.

## Groups examples
- The modifiers keys (red).
- Direction keys: hjkl (vim), arrows, home, end, pageup, pagedown (yellow).
- F1 -> F12 (magenta).
- Multimedia keys (green) mute key (yellow).
- function keys (white).
- gaming keys disabled by default (black 000000, change this only).

```
g810-led -g gkeys ffffff
```

```
g810-led --help-keys
```

## Credits
I'd like to thanks Matmoul for his project [g810-led](https://github.com/MatMoul/g810-led) that's provide a simple & funny way to play with our RGB Logitech keyboards.

## Supported models
- G213 G410 G413 G512 G513 G610 G810 G815 G910 Gpro

![screenshot](https://github.com/archusXIV/g810-led-fr-skel/blob/main/screenshots/g815_qwerty.jpg)
## How to install?
- First follow this page:
    - [install instructions](https://github.com/MatMoul/g810-led/blob/master/INSTALL.md)
    - If it fails: [AUR solution](https://aur.archlinux.org/packages/g810-led-git#comment-919059)
```
git clone https://github.com/MatMoul/g810-led.git
cd g810-led.git
EDITOR=<your_editor_name> src/helpers/helper.h
# then add: #include <cstdint> at line 20 (before #include <iostream>), save and run:
make
sudo make install
```
- Your keyboard should light on with the default profile provided by Matmoul.
- Now run the install script:
```
git clone https://github.com/archusXIV/g810-led-fr-skel.git
cd g810-led-fr-skel
chmod +x ./install_profiles.sh && ./install_profiles.sh
cp ./scripts/{g810-led-menu,g810_{create,delete,switch}_profile} "$HOME/.local/bin"
# ... if ~/.local/bin is in your $PATH
```
- To use a specific layout template, copy the desired skeleton into the project root before generating a profile, or start from the matching file under [skeletons](skeletons).
## How to use?
- First run this command to verify your keyboard model.
```
lsusb | grep -i keyboard
# Bus 003 Device 003: ID 046d:c33f Logitech, Inc. G815 Mechanical Keyboard
```
- Now it's time to create your first group or key profile.
    - groups are described above...
    - key profiles also use groups but some keys have different colors than the group to which they belong.
    - A prompt will appear to let you choose between the two methods.

- We can use each script independently or use the g810-led-menu script to launch a menu.
![screenshot](https://github.com/archusXIV/g810-led-fr-skel/blob/main/screenshots/g810-led-menu.png)

```
g810_create_profile
```
- Next command can be launched with an argument or not.
```
g810_switch_profile gruvbox
```
- You can also use a custom profile name created from a layout skeleton, for example the US template.
- Deleting profiles can also be done with an argument or not.
If you delete the profile in use, the default one will be set.
```
g810_delete_profile gruvbox
```
- The last chosen profile will be launched when rebooting your machine using **udev rules** so be aware of that. Have fun!



