DTP-T1000 Pre-IPL dumper

This tool allows to dump Lib-PSP iplloader's loader segment (or full binary on 0.4 and 0.6) using kbooti/bootdispi files as input
Check the wiki page below for more information:

https://playstationdev.wiki/pspdevwiki/index.php?title=PRE-IPL

If you wonder what a DTP-T1000 is and what development SKUs are available, an overview is available here: https://playstationdev.wiki/pspdevwiki/index.php?title=SKU_Models

Requirements: 

- A DTP-T1000 or a DEM-1000 unit.
- Access with root privileges to the Communication_Processor (check the wiki page below for more details)
http://www.psdevwiki.com/ps3/Communication_Processor

How to:


Extract the archive on your DTP-T1000/DEM-1000 (using /tmp is preferable due to the extra space available on this partition) 

chmod all files with proper permission

copy respective kbooti/bootdispi from the SDK in the folder containing the script using the following file names (without the quotes)

"kbooti_040.bin" (for SDK 0.4.X-0.5.X)

SHA-256: 18B5BF7AEFE956D99B397AAAAC94DC965ADFDBC2BE0532096BBC1F8F8C5B7C34 (Full decrypted binary)

"kbooti_060.bin" (for SDK 0.6.X-0.7.X)

SHA-256: 5CDEDDEBE11807DDAEB17BAC03945A0B828E8057C9587652CA207E3BB959AC96 (Full decrypted binary)

"kbooti_070.bin" (for SDK 0.7.0-0.8.X)

SHA-256: 388FA1DB87973A2A37D576AAAB785D840CA4D883AB5111781DA2D0AF59CFE667 (Full decrypted binary)

SHA-256: 351ECD64C945489999D477ECAFBFBB8FE769C2484636D2F7323557F7EEFD54A2 (Decrypted payload)

"kbooti_090.bin" (for SDK 0.9.0-2.5.0)

SHA-256: E415198C16E29D96C9232FF78272EE639D0630A56E370ED18A33D358FEF7CA95 (Full decrypted binary)

SHA-256: 4F794E4FF32D5267AEAEDBA362D005EF0B7E93E29CF7C8209E0D9DBB0144F4DB (Decrypted payload)

"kbooti_260.bin" (for SDK 2.6.0)

SHA-256: 0A83CB36F1FE7C2A9A53BD46E6FFD915D4D1BB97EED3D1EF336960DB752C3446 (Full decrypted binary)

SHA-256: 8821D96F5FB35C55DF649A97F5703F8A705362C2F54665B5EE4221E686B5578A (Decrypted payload)

"kbooti_271.bin" (for SDK 2.7.0)

SHA-256: 7DDFF7093906C10BA11D7402E9939763173F1ADEA59A38B4006484FD18EA21EA (Full decrypted binary)

SHA-256: F9160C03EC6174F54F1C1EB645CFBBDB65B3DA47DA1A5478BE30E5EB2B0852B4 (Decrypted payload)

"kbooti_350.bin" (for SDK 3.5.0+)


SHA-256: AAF6F3CF0D7E028F43BE6FB788018F7A6F49B140A2591937B5C3A8373D2186A5 (Full decrypted binary with xor key)

SHA-256: 5066E257EC43DA37788535C331E5A01955F5F498B103C340903409649BCB5046 (Decrypted payload with xor key)


Note: This will dump the 3.5.0 Lib-PSP iplloader with the XOR key. (key is only wiped from uncached memory in JIG mode)
the XOR key is meant to be located at 0xB0C in the full binary and 0x88C in the payload so you can just retrieve it and paste it back.


run the kbooti_dump.sh script.

Dumps will be named Lib-PSP iplloader*

OPTIONAL: You can supply your own retail psp bootrom named pre-ipl.bin, should you do so, the dumper will rebuild the whole Lib-PSP iplloader binary including the loader part.

COMPILATION INSTRUCTIONS: 

* Build dump_cp_addr and dump_cp_add_devarg using the toolchain available below: 

https://playstationhax.xyz/forums/topic/1191-release-cp_toolchain-by-flatz/

* Build the 0xbfc00000 and 0xa0010000 shellcodes

* Copy the build dump_cp_addr.elf, the 0x8001.bin and 0xbfc.bin shellcodes as well as the 0xBFE01100v2.bin, 0xBFE01100v2_350.bin and jr_0xbfe01100.bin IPL blocks at the same location.
