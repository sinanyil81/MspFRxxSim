#!/usr/bin/env bash

TI_MSPGCC_URL=http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/9_2_0_0/export/msp430-gcc-full-linux-x64-installer-9.2.0.0.run
TI_MSPGCC_DIR=/opt/ti-mspgcc

echo "Downloading TI MSPGCC"
wget -qO installer $TI_MSPGCC_URL

echo "Installing TI MSPGCC"
chmod +x installer
./installer --mode unattended --prefix $TI_MSPGCC_DIR

echo "export PATH=$TI_MSPGCC_DIR/bin:$PATH" >> /etc/profile
echo "export MSPGCC_ROOT=$TI_MSPGCC_DIR" >> /etc/profile
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TI_MSPGCC_DIR/bin" >> /etc/profile
$TI_MSPGCC_DIR/install_scripts/msp430uif_install.sh
ln -s $TI_MSPGCC_DIR/bin/libmsp430.so /usr/lib/

sudo apt-get -y update
sudo apt-get -y install default-jdk
sudo apt-get -y install default-jre
sudo apt-get -y install mspdebug
