BUILD INSTRUCTIONS: 

Requires CP toolchain by Flatz (check link below) 

https://playstationhax.xyz/forums/topic/1191-release-cp_toolchain-by-flatz/

to build run the following command: 

mipsel-linux-gcc -o dump_cp_addr.elf dump_cp_addr.c -static -static-libgcc

An optional version called dump_cp_addr_devarg allowing you change the device to dump from using the following syntax has been added.

./dump_cp_addr_devarg device address size > file
for example ./dump_cp_addr_devarg.elf /dev/mem 0x1D650000 0x1000 > dump.bin

