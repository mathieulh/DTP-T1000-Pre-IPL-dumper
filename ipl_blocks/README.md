# Build instructions

Create the proper encrypted IPL blocks from the compiled IPL shellcode using a custom version of ipltool (original project available here: https://github.com/zecoxao/ipltool )

For 0.4.0 and 0.6.0 build using 0x00000000 as load address and entry point and 0x20 for the data size
for 0.7.0 and later build using the original values 

<pre>
unsigned long int entry			= 0x040F0000;
u32 loadAddr 					= 0x040F0000;
u32 dataSize 					= 0xF50;
u32 decblkSize 					= 0xF60;
</pre>

Add 0xF30 worth of padding data (can be 00s) at the end of the compiled shellcode before encrypting.
