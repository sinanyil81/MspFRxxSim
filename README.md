# Vagrant for mspfrxxsim

This repo contains a Vagrant virtual machine environment to run [SIREN - Batteryless Simulator](https://github.com/PERSISTLab/BatterylessSim), which is a simulator for modern, FRAM enabled MSP430s with voltage traces, IV surfaces (for energy harvesting), and with common hardware components like TARDIS / CusTARD and the CC1101.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisities

Install [Vagrant](https://www.vagrantup.com/) environment. 

Our virtual machine will have [TI GCC for MSP430s](https://www.ti.com/tool/MSP430-GCC-OPENSOURCE) automatically installed. When you start 

But you may also want to install [Code Composer Studio (CCS) Integrated Development Environment (IDE)
CCSTUDIO](https://www.ti.com/tool/CCSTUDIO) that helps you to compile your application using **TI GCC for MSP430**.  



#### For Linux:

	chmod +x msp430-gcc-full-linux-installer-4.0.1.0.run
	./msp430-gcc-full-linux-installer-4.0.1.0.run
	Step through installation, and choose the default path (/home/$USER/ti/gcc)


