# Build instructions

Create the proper prototype encrypted IPL block from the compiled IPL shellcode using a custom version of ipltool (original project available here: https://github.com/zecoxao/ipltool )

use the following values

<pre>
unsigned long int entry			= 0x00000000;
u32 loadAddr 					= 0x00000000;
u32 dataSize 					= 0x10;
u32 decblkSize 					= 0x10;
</pre>

An encrypted pre-built version of this shellcode in IPL block format is already suppplied as jr_0xbfe01100.bin in the ipl_blocks folder
