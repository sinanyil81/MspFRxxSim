# Vagrant Environment for Compiling and Simulating MSPFRXX Code

This repo contains a Vagrant virtual machine environment to compile C code for MSP430 target. The virtual machine comes with:
- [TI GCC 9.2.0.0 for MSP430](http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/9_2_0_0/export/msp430-gcc-full-linux-x64-installer-9.2.0.0.run)
- [SIREN - Batteryless Simulator](https://github.com/PERSISTLab/BatterylessSim), which is a simulator for FRAM enabled MSP430s.

## Installation steps

- Install [Vagrant](https://www.vagrantup.com/) environment. 
- Clone this repository:

		git clone https://github.com/sinanyil81/mspsim-vagrant.git

## Running the virtual machine
- After clomning this repository, change your directory: `$ cd mspsim-vagrant`
- `$ vagrant up` creates the VM for the first time (it might take some time)
- `$ vagrant ssh` lets you log into the VM

## Building SIREN 
- In the virtual machine, change directory: `$cd /vagrant`. This directory (in the virtual machine) is shared between your host machine and the virtual machine. It includes the cloned repository. Any change you do in your host machine is accesible in the virtual machine, or vice versa. 
- Compile SIREN by performing the following steps:

		make
		make jar

## Running the simulator
On your host machine, you may want to install [Code Composer Studio (CCS) Integrated Development Environment (IDE) 
CCSTUDIO](https://www.ti.com/tool/CCSTUDIO) that helps you to compile your C application using **TI GCC for MSP430**. You can also install [TI GCC for MSP430s](https://www.ti.com/tool/MSP430-GCC-OPENSOURCE) to compile your C application. After compilation, place the binary file,  e.g., `main.out`, into `mspsim` directory. 

Our virtual machine will have [TI GCC for MSP430s](https://www.ti.com/tool/MSP430-GCC-OPENSOURCE) automatically installed. When you start 

But 

## Sample Programs
There are sample C programs targeting MSP430FR6989. 
A simple blink program is included in the repo along with an example `Makefile` with all usual flags set for size and speed. To make sure things work compile the code:


		$ make

	
Now you can install the code onto the connected MSP430FR5969 Launchpad in a separate terminal window, assuming you have mspdebug.


		$ mspdebug tilib "prog msp430fr5969.out" 

	
You should see some blinking, at this point.

### Adding your project repo
The `/vagrant` folder is shared between host and the VM. If you `git clone` anything to the main folder, you can have a workspace. For example within the vagrant box:

$ cd /vagrant
$ mkdir Repos
$ git clone [REPO_URL] [REPO_NAME]

The "Repos" directory is a shared directory between your vagrant box and your host computer. in the same folder as this README.md file.

### Using your favorite text editor
Since "Repos" directory is a shared directory between your vagrant box and your host computer, you do not have to change your workflow in any way. ONLY use the vagrant box to compile code.

Open your favorite text editor, IDE, or VIM on your HOST computer, and navigate to this repository, `msp430-vagrant/Repos` directory. You will see the recently added project repository. Edit code at will, and use the vagrant to compile.

