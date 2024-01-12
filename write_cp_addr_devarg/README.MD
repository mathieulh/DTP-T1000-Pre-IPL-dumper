usage: a.out <fromfile> <todevice> <address>

Build using

* Cygwin x86 (does not appear to work with Cygwin64) 
* Communication processor mipsel toolchain

path is hardcoded to PATH=/cygdrive/r/mipsel-toolchain/bin:$PATH (use subst to match the path consequently) 
http://technet.microsoft.com/en-us/library/bb491006.aspx

Use the following comand to build:
mipsel-linux-gcc-3.3.4 -static -o write_cp_addr_devarg.elf write_cp_addr_devarg.c
