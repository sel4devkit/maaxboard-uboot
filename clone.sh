#!/bin/bash
#
# Copyright 2022 Capgemini Engineering
#
# SPDX-License-Identifier: BSD-2-Clause
#

#
# Script for downloading the u-boot source for the Avnet MaaXBoard
#

# Clone the u-boot source
echo "Cloning U-Boot source code..."
git clone https://github.com/Avnet/uboot-imx.git
cd uboot-imx 
git checkout f752480a4c29d3ff7fd4008863adc286019bf594
cd ..

# Clone ARM trusted firmware
echo "Cloning ARM Trusted Firmware..."
git clone https://github.com/Avnet/imx-atf.git
cd imx-atf
git checkout d801fd97ea9606bf5a686334639abac2ddb77985
cd ..

# Clone the imx-mkimage tools
echo "Cloning imx-mkimage tools..."
git clone https://github.com/Avnet/imx-mkimage.git
cd imx-mkimage
git checkout 9a299d31a2045db3eafb7ee61ec3c7ee87225d53
cd ..

# Provide some guidance on usage
echo "+----------------------------------------------------------------+"
echo "|  Source code for compiling U-Boot now cloned.                  |"
echo "|  This folder can now be transferred to an offline computer     |"
echo "|  and U-Boot built by running build-offline.sh.                 |"
echo "|  If you ran build.sh, build will start now.                    |"
echo "+----------------------------------------------------------------+"
