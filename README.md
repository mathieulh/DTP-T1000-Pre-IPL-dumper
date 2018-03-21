DTP-T1000 Pre-IPL dumper

This tool allows to dump Lib-PSP iplloader's loader segment (or full binary on 0.4 and 0.6) using kbooti/bootdispi files as input
Check the wiki page below for more information:

https://www.pspdevwiki.com/index.php?title=PRE-IPL

Requirements: 

- A DTP-T1000 or a DEM-1000 unit.
- Access with root privileges to the Communication_Processor (check the wiki page below for more details)
http://www.psdevwiki.com/ps3/Communication_Processor

How to: 

Install the 5.00 or higher hardward tool update OR perform a system init on your device (hold the system init button while pressing the power button and wait)

Extract the archive on your DTP-T1000/DEM-1000 (using /tmp is preferable due to the extra space available on this partition) 

chmod all files with proper permission

copy respective kbooti/bootdispi from the SDK in the folder containing the script using the following file names (without the quotes)

"kbooti_040.bin" (for SDK 0.4.X-0.5.X)

"kbooti_060.bin" (for SDK 0.6.X-0.7.X)

"kbooti_070.bin" (for SDK 0.7.0-0.8.X)

"kbooti_090.bin" (for SDK 0.9.0-2.5.0)

"kbooti_260.bin" (for SDK 2.6.0)

"kbooti_271.bin" (for SDK 2.7.0)

run the kbooti_dump.sh script.

Dumps will be named Lib-PSP iplloader*
