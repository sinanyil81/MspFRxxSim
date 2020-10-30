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

## Building SIREN Instruction Level Simulator
- In the virtual machine, change directory: `$cd /vagrant`. This directory (in the virtual machine) is shared between your host machine and the virtual machine. It includes the cloned repository. Any change you do in your host machine is accesible in the virtual machine, or vice versa. 
- Compile SIREN by performing the following steps:
		
		$ cd mspsim
		$ make
		$ make jar

## Compiling application C code and sample firmware
- Place your application code (C code) that is targeted for the MSP430FR6989 platform in the virtual machine and compile it using *msp430-elf-gcc* to output the firmware file,  e.g., `main.out`. 
- Alternatively, on your host machine, you may want to install [Code Composer Studio (CCS) Integrated Development Environment (IDE) 
CCSTUDIO](https://www.ti.com/tool/CCSTUDIO) that helps you to compile your C application using **TI GCC for MSP430**. You can also install [TI GCC for MSP430s](https://www.ti.com/tool/MSP430-GCC-OPENSOURCE) on your host to compile your C application. After compilation, place the firmware file,  e.g., `main.out`, into `mspsim` directory. 
- There are also sample C programs targeting MSP430FR6989 in `mspsim/firmware/` directory. You can compile these applications in the virtual machine, as an example:

		$ cd firmware/sense_and_send
		$ cd static
		$ make
that outputs  `main.out`

## Running the simulator 
- In order to simulate your application code, e.g., *firmware/sense_and_send/main.out*:
	
		$ cd /vagrant/mspsim
		$ make run FIRMWAREFILE=firmware/sense_and_send/main.out
- You can write `stop` to stop simulation. 
- You can write `profile` to see the profiling information of the functions, i.e., how many cycles it took to execute the corresponding functions in the applicaion. 
- Check [commands](https://github.com/sinanyil81/msp430-vagrant/blob/main/mspsim/scripts/HELP.txt) to see which commands are available for the simulator.
- Modify `mspsim/scripts/mayfly.sc` file that configures the simulator. 
		

 




