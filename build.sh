#!/bin/bash

# repo
repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs --depth=1

git clone https://github.com/Project-Nightcord/manifesto .repo/local_manifests

/opt/crave/resync.sh

rm -rf build/make

https://github.com/Project-Nightcord/android_build build/make

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
lunch lineage_ysl-bp4a-userdebug

# Run
m bacon
