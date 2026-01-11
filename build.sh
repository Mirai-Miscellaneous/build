#!/bin/bash

# Cleanup
rm -rf .repo/local_manifests
rm -rf device/xiaomi
rm -rf kernel/xiaomi
rm -rf vendor/xiaomi

# Clone rom
repo init -u https://github.com/crdroidandroid/android.git -b 13.0 --git-lfs --depth=1

# Clone local_manifests repository
git clone https://github.com/Mirai-Miscellaneous/local_manifests --depth=1 -b lineage-20_k4.19 .repo/local_manifests

# repo sync
/opt/crave/resync.sh

#symlink libncurses 6 >> 5
sudo ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5
sudo ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6   /usr/lib/x86_64-linux-gnu/libtinfo.so.5

# env
. build/envsetup.sh

# Export
export BUILD_USERNAME=RenzAlt
export BUILD_HOSTNAME=nigo-at25
export KBUILD_BUILD_USER=RenzAlt
export KBUILD_BUILD_HOST=NeedAlt

# Lunch
# lunch lineage_ysl-bp2a-userdebug
lunch lineage_vince-userdebug

# Run
mka bacon
