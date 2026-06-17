#!/bin/bash

# repo
repo init -u https://github.com/LineageOS/android.git -b lineage-22.2 --git-lfs --depth=1

git clone https://github.com/Mika-Room/manifesuto .repo/local_manifests

/opt/crave/resync.sh

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
lunch lineage_Mi8953-bp1a-userdebug

# Run
m bacon
