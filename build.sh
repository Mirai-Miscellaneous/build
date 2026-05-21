#!/bin/bash

#symlink libncurses 6 >> 5
sudo ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5
sudo ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6   /usr/lib/x86_64-linux-gnu/libtinfo.so.5

# env
. build/envsetup.sh

# Export
export BUILD_USERNAME=Mikana
export BUILD_HOSTNAME=Ame
export KBUILD_BUILD_USER=Mikana
export KBUILD_BUILD_HOST=Ame

# Lunch
# lunch lineage_ysl-bp2a-userdebug
lunch lineage_MiThoriumSSI-bp4a-userdebug

# Run
mka systemimage
