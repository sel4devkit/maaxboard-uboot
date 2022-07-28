# MaaXBoard-Uboot

This repository contains a script and build area for building u-boot for the Avnet MaaXBoard.

# Building
Run `build.sh` to build normally.
For offline building, first run `clone.sh` to clone the required source code. `build-offline.sh` can then be run without an internet connection.

During the build process the following directories will be used / created:

- **firmware**: This directory holds firmware for the DDR PHY and HDMI as supplied by NXP [(link to firmware)](https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/firmware-imx-8.14.bin). The license agreement for this firmware must be accepted during the u-boot build process.
- **imx-atf**: This directory is used to checkout and build the ATF (ARM Trusted Firmware) for the i.MX8.
- **imx-mkimage**: This directory is used to checkout and build a fork of the mkimage tool modified by Avnet for the MaaXBoard that combines the various elements into a single image suitable for writing to an SD card.
- **uboot-imx**: This directory is used to checkout and build a fork of U-Boot modified by Avnet for the MaaXBoard.

On completion of the build process the **flash.bin** file is generated in the top level directory alongside the build script. This file can then be written to an SD card suitable for booting the MaaXBoard with the following command:
```
dd if=flash.bin of=/dev/<SD card device id> bs=1k seek=33 
```
