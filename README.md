# g810-led profile fr_FR skeleton for linux
create, delete or switch g810-led profiles for AZERTY fr_FR Logitech keyboards.

Youtube [video](https://www.youtube.com/watch?v=sfBx5aLTEFM), french spoken.

Profiles depend on a [profile_skel](https://github.com/archusXIV/g810-led-fr-skel/blob/main/profile_skel) file that you can edit before installation, keys names are organized by raws based on a latin1 fr_CH layout because the g810-led project started like this. But here the translation is done simply by removing keys or placing them in the right raw for a fr_FR layout.
Note that a [group_skel](https://github.com/archusXIV/g810-led-fr-skel/blob/main/group_skel) is also provided.

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

![screenshot](https://github.com/archusXIV/g810-led-fr-skel/blob/main/g815_qwerty.jpg)
## How to install?
- First following this page:
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
cd g810-led-fr-skell
chmod +x ./install_profiles.sh && ./install_profiles.sh
cp ./scripts/g810_{create,delete,switch}_profile "$HOME/.local/bin"
# ... if ~/.local/bin is in your $PATH
```
## How to use?
- First modify the [scripts](https://github.com/archusXIV/g810-led-fr-skel/tree/main/scripts) variables myModel{Name,Id,Binary} values according to your keyboard model.
```
lsusb | grep -i keyboard
# Bus 003 Device 003: ID 046d:c33f Logitech, Inc. G815 Mechanical Keyboard
```
- Your variables should look like this:
```
myModelName=G815
myModelId=c33f
myModelBinary=g815-led # lower case
```
- Now it's time to create your first group or key profile.
    - groups are described above...
    - key profiles also use groups but some keys have different colors than the group to which they belong.
    - A prompt will appear to let you choose between the two methods.


```
g810_create_profile
```
- Next command can be launched with an argument or not.
```
g810_switch_profile gruvbox
```
- Deleting profiles can also be done with an argument or not.
If you delete the profile in use, the default one will be set.
```
g810_delete_profile gruvbox
```
- The last chosen profile will be launched when rebooting your machine using **udev rules** so be aware of that. Have fun!



