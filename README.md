# Vagrant Environment for Simulating MSPFRXX

This repo contains a Vagrant virtual machine environment to run [SIREN - Batteryless Simulator](https://github.com/PERSISTLab/BatterylessSim), which is a simulator for FRAM enabled MSP430s.

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

Usage
-----
- `$ vagrant up` creates the VM for the first time
- `$ vagrant ssh` lets you log into the VM
- see `vagrant -h` for info on how to suspend/shutdown/delete/etc the VM.
- The root folder(which has the Vagrantfile and example code) is accessible as `/vagrant`

### Compiling
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

