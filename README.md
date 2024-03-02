# g810-led-fr-skel (under construction)
create delete or switch g810-led profiles for AZERTY fr_FR Logitech keyboards.

## Credits
I'd like to thanks Matmoul for his project [g810-led](https://github.com/MatMoul/g810-led) that's provide a simple & funny way to play with our RGB Logitech keyboards.

## Supported models
- G213 G410 G413 G512 G513 G610 G810 G815 G910 Gpro
## How to install?
- First following this page:
    - https://github.com/MatMoul/g810-led/blob/master/INSTALL.md
    - If it fails: https://aur.archlinux.org/packages/g810-led-git#comment-919059
```
git clone https://github.com/MatMoul/g810-led.git
cd g810-led.git
EDITOR=<your_editor_name> src/helpers/helper.h
# then add: #include <cstdint> at line 21, save and run:
make
sudo make install
```
- Your keyboard should light on with the default profile provided by Matmoul.
- Now run the install script:
```
chmod +x ./install_profiles.sh && ./install_profiles.sh
cp ./scripts/g810_{create,delete,switch}_profile "$HOME/.local/bin"
# ... if ~/.local/bin is in your $PATH
```
## How to use?
- First modify the scripts variables myModel{Name,Id,Binary} values according to your keyboard model.
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
Then in a terminal run:
```
g810_create_profile
