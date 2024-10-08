#!/bin/bash

#
# Copyright 2022 Capgemini Engineering
#
# SPDX-License-Identifier: BSD-2-Clause
#

#
# Script for building the u-boot binary (flash.bin) for the Avnet MaaXBoard
#

# Build the u-boot binaries
cd uboot-imx || exit
export CROSS_COMPILE=aarch64-linux-gnu-
make maaxboard_defconfig
make
cd ..

# Decompress the DDR PHY / HDMI firmware supplied by NXP
cd firmware || exit
sh firmware-imx-8.14.bin
cd ..

# Build ARM trusted firmware
cd imx-atf || exit
make CROSS_COMPILE=aarch64-linux-gnu- PLAT=imx8mq
cd ..

# Copy the binaries, firmware and device tree into the imx-mkimage area
cp uboot-imx/spl/u-boot-spl.bin imx-mkimage/iMX8M
cp uboot-imx/u-boot-nodtb.bin imx-mkimage/iMX8M
cp uboot-imx/arch/arm/dts/maaxboard.dtb imx-mkimage/iMX8M/fsl-imx8mq-ddr4-arm2.dtb
cp uboot-imx/tools/mkimage imx-mkimage/iMX8M/mkimage_uboot
cp firmware/firmware-imx-8.14/firmware/ddr/synopsys/ddr4_imem_1d_202006.bin imx-mkimage/iMX8M/ddr4_imem_1d.bin
cp firmware/firmware-imx-8.14/firmware/ddr/synopsys/ddr4_imem_2d_202006.bin imx-mkimage/iMX8M/ddr4_imem_2d.bin
cp firmware/firmware-imx-8.14/firmware/ddr/synopsys/ddr4_dmem_1d_202006.bin imx-mkimage/iMX8M/ddr4_dmem_1d.bin
cp firmware/firmware-imx-8.14/firmware/ddr/synopsys/ddr4_dmem_2d_202006.bin imx-mkimage/iMX8M/ddr4_dmem_2d.bin
cp firmware/firmware-imx-8.14/firmware/hdmi/cadence/signed_hdmi_imx8m.bin imx-mkimage/iMX8M/signed_hdmi_imx8m.bin
cp imx-atf/build/imx8mq/release/bl31.bin imx-mkimage/iMX8M

# Build the image
cd imx-mkimage || exit
make SOC=iMX8MQ flash_ddr4_val
cd ..
cp imx-mkimage/iMX8M/flash.bin .

# Provide some guidance on usage
echo "+----------------------------------------------------------------+"
echo "|  MaaXBoard U-Boot binary generated at ./flash.bin              |"
echo "|  Binary can be written to an SD card with command:             |"
echo "|     dd if=flash.bin of=/dev/<SD card device id> bs=1k seek=33  |"
echo "+----------------------------------------------------------------+"
