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
git clone https://github.com/sel4devkit/uboot-imx

# Clone ARM trusted firmware
echo "Cloning ARM Trusted Firmware..."
git clone https://github.com/sel4devkit/imx-atf

# Clone the imx-mkimage tools
echo "Cloning imx-mkimage tools..."
git clone https://github.com/sel4devkit/imx-mkimage

# Provide some guidance on usage
echo "+----------------------------------------------------------------+"
echo "|  Source code for compiling U-Boot now cloned.                  |"
echo "|  This folder can now be transferred to an offline computer     |"
echo "|  and U-Boot built by running build-offline.sh.                 |"
echo "|  If you ran build.sh, build will start now.                    |"
echo "+----------------------------------------------------------------+"
