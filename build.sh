#!/bin/bash

# repo
repo init -u https://github.com/Lunaris-AOSP/android -b 16.2 --git-lfs --depth=1

git clone https://github.com/Project-Nightcord/manifesto .repo/local_manifests

/opt/crave/resync.sh

git clone https://github.com/Meow-prjkt/android_hardware_dolby hardware/dolby

git clone https://github.com/imren0x/packages_apps_GameBar packages/apps/GameBar

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

rm -rf hardware/xiaomi/megvii

# Lunch
lunch lineage_vince-bp4a-userdebug

# Run
m bacon
