#!/bin/sh

#Version=/var/lib/toolupdate/toolupdate.version

#delete all temporary files
rm -f *.tmp
#if grep '1.5.0' $Version;then



#0.4.0
#check if the kbooti file exists
if [ -f kbooti_040.bin ]; then
#appends the dumper payload to the IPL block
cat jr_0xbfe01100.bin 0xbfc.bin > ipl_0xbfc.bin.tmp
#create a temporary file only containing the first 0x1000 of the kbooti
dd if=kbooti_040.bin bs=1 count=4096 of=kbooti.tmp
#appends the IPL containing the crafted IPL to the temporary kbooti
cat kbooti.tmp ipl_0xbfc.bin.tmp > kbootidmp.tmp
#check if the current CP version contains the dstdb binary, if not use bloadp instead
if [ -f /usr/local/sony/bin/bootdispi/dstdb ]; then
#write the kbooti+IPL to 0x1D600000 using dstdb's bloadp command
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.tmp
#write the kbooti+IPL to 0x1D600000 using bloadp if dstdb is not present
elif [ -f /usr/local/sony/bin/bootdispi/dsbloadp ]; then
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.tmp
#If neither dstdb or bloadp binaries are present notify the user of an unsupported CP version
else echo "Unsupported CP Version!"
fi
#reset tachyon
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
#wait 10 seconds for the payload to run properly before killing dspreset
sleep 10
#tachyon crashes and does not return a proper reset value so dspreset is stuck in a waiting loop, thus we kill dspreset manually
pkill dspreset
#read address 0x1D650000 where our payload has written the dump. (0xBFE50000 on tachyon)
./dump_cp_addr_devarg.elf /dev/mem 0x1D650000 0x1000 > "Lib-PSP iplloader0.4.0.bin.tmp"
#create the final file after removing the excess memory data from the dump
dd if="Lib-PSP iplloader0.4.0.bin.tmp" bs=1 count=1472 of="Lib-PSP iplloader0.4.0.bin"
#delete all temporary files
rm -f *.tmp
fi

#0.6.0
if [ -f kbooti_060.bin ]; then
cat jr_0xbfe01100.bin 0xbfc.bin > ipl_0xbfc.bin.tmp
dd if=kbooti_060.bin bs=1 count=4096 of=kbooti.tmp
cat kbooti.tmp ipl_0xbfc.bin.tmp > kbootidmp.tmp
if [ -f /usr/local/sony/bin/bootdispi/dstdb ]; then
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.tmp
elif [ -f /usr/local/sony/bin/bootdispi/dsbloadp ]; then
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.tmp
else echo "Unsupported CP Version!"
fi
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr_devarg.elf /dev/mem 0x1D650000 0x1000 > "Lib-PSP iplloader0.6.0.bin.tmp"
dd if="Lib-PSP iplloader0.6.0.bin.tmp" bs=1 count=1872 of="Lib-PSP iplloader0.6.0.bin"
rm -f *.tmp
fi

#0.7.0
if [ -f kbooti_070.bin ]; then
cat 0xbfe01100v2.bin 0x8001.bin > ipl_0x8001.bin.tmp
dd if=kbooti_070.bin bs=1 count=4096 of=kbooti.tmp
cat kbooti.tmp ipl_0x8001.bin.tmp > kbootidmp.tmp
if [ -f /usr/local/sony/bin/bootdispi/dstdb ]; then
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.tmp
elif [ -f /usr/local/sony/bin/bootdispi/dsbloadp ]; then
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.tmp
else echo "Unsupported CP Version!"
fi
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr_devarg.elf /dev/mem 0x1D650000 0x1000 > "Lib-PSP iplloader0.7.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader0.7.0_0x80010000.bin.tmp" bs=1 count=2196 of="Lib-PSP iplloader0.7.0_0x80010000.bin"
if [ -f pre-ipl.bin ]; then
dd if=pre-ipl.bin bs=1 count=52 of="Lib-PSP iplloader_full.bin.1.tmp"
echo -ne "\\x94\\x08" >> "Lib-PSP iplloader_full.bin.1.tmp"
dd if=pre-ipl.bin bs=1 skip=54 count=586 of="Lib-PSP iplloader_full.bin.2.tmp"
cat "Lib-PSP iplloader_full.bin.1.tmp" "Lib-PSP iplloader_full.bin.2.tmp" "Lib-PSP iplloader0.7.0_0x80010000.bin" > "Lib-PSP iplloader_0.7.0.bin"
fi
rm -f *.tmp #deletes all temporary files
fi

#0.9.0
if [ -f kbooti_090.bin ]; then
cat 0xbfe01100v2.bin 0x8001.bin > ipl_0x8001.bin.tmp
dd if=kbooti_090.bin bs=1 count=4096 of=kbooti.tmp
cat kbooti.tmp ipl_0x8001.bin.tmp > kbootidmp.tmp
if [ -f /usr/local/sony/bin/bootdispi/dstdb ]; then
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.tmp
elif [ -f /usr/local/sony/bin/bootdispi/dsbloadp ]; then
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.tmp
else echo "Unsupported CP Version!"
fi
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr_devarg.elf /dev/mem 0x1D650000 0x1000 > "Lib-PSP iplloader0.9.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader0.9.0_0x80010000.bin.tmp" bs=1 count=2196 of="Lib-PSP iplloader0.9.0_0x80010000.bin"
if [ -f pre-ipl.bin ]; then
dd if=pre-ipl.bin bs=1 count=52 of="Lib-PSP iplloader_full.bin.1.tmp"
echo -ne "\\x94\\x08" >> "Lib-PSP iplloader_full.bin.1.tmp"
dd if=pre-ipl.bin bs=1 skip=54 count=586 of="Lib-PSP iplloader_full.bin.2.tmp"
cat "Lib-PSP iplloader_full.bin.1.tmp" "Lib-PSP iplloader_full.bin.2.tmp" "Lib-PSP iplloader0.9.0_0x80010000.bin" > "Lib-PSP iplloader_0.9.0.bin"
fi
rm -f *.tmp
fi

#2.6.0
if [ -f kbooti_260.bin ]; then
cat 0xbfe01100v2.bin 0x8001.bin > ipl_0x8001.bin.tmp
dd if=kbooti_260.bin bs=1 count=4096 of=kbooti.tmp
cat kbooti.tmp ipl_0x8001.bin.tmp > kbootidmp.tmp
if [ -f /usr/local/sony/bin/bootdispi/dstdb ]; then
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.tmp
elif [ -f /usr/local/sony/bin/bootdispi/dsbloadp ]; then
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.tmp
else echo "Unsupported CP Version!"
fi
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr_devarg.elf /dev/mem 0x1D650000 0x1000 > "Lib-PSP iplloader2.6.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader2.6.0_0x80010000.bin.tmp" bs=1 count=3060 of="Lib-PSP iplloader2.6.0_0x80010000.bin"
if [ -f pre-ipl.bin ]; then
dd if=pre-ipl.bin bs=1 count=52 of="Lib-PSP iplloader_full.bin.1.tmp"
echo -ne "\\xf4\\x0b" >> "Lib-PSP iplloader_full.bin.1.tmp"
dd if=pre-ipl.bin bs=1 skip=54 count=586 of="Lib-PSP iplloader_full.bin.2.tmp"
cat "Lib-PSP iplloader_full.bin.1.tmp" "Lib-PSP iplloader_full.bin.2.tmp" "Lib-PSP iplloader2.6.0_0x80010000.bin" > "Lib-PSP iplloader_2.6.0.bin"
fi
rm -f *.tmp
fi

#2.7.1
if [ -f kbooti_271.bin ]; then
cat 0xbfe01100v2.bin 0x8001.bin > ipl_0x8001.bin.tmp
dd if=kbooti_271.bin bs=1 count=4096 of=kbooti.tmp
cat kbooti.tmp ipl_0x8001.bin.tmp > kbootidmp.tmp
if [ -f /usr/local/sony/bin/bootdispi/dstdb ]; then
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.tmp
elif [ -f /usr/local/sony/bin/bootdispi/dsbloadp ]; then
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.tmp
else echo "Unsupported CP Version!"
fi
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr_devarg.elf /dev/mem 0x1D650000 0x1000 > "Lib-PSP iplloader2.7.1_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader2.7.1_0x80010000.bin.tmp" bs=1 count=3060 of="Lib-PSP iplloader2.7.1_0x80010000.bin"
if [ -f pre-ipl.bin ]; then
dd if=pre-ipl.bin bs=1 count=52 of="Lib-PSP iplloader_full.bin.1.tmp"
echo -ne "\\xf4\\x0b" >> "Lib-PSP iplloader_full.bin.1.tmp"
dd if=pre-ipl.bin bs=1 skip=54 count=586 of="Lib-PSP iplloader_full.bin.2.tmp"
cat "Lib-PSP iplloader_full.bin.1.tmp" "Lib-PSP iplloader_full.bin.2.tmp" "Lib-PSP iplloader2.7.1_0x80010000.bin" > "Lib-PSP iplloader_2.7.1.bin"
fi
rm -f *.tmp
fi

#3.5.0
if [ -f kbooti_350.bin ]; then
cat 0xbfe01100v2_350.bin 0x8001.bin > ipl_0x8001.bin.tmp
dd if=kbooti_350.bin bs=1 count=4096 of=kbooti.tmp
cat kbooti.tmp ipl_0x8001.bin.tmp > kbootidmp.tmp
if [ -f /usr/local/sony/bin/bootdispi/dstdb ]; then
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.tmp
elif [ -f /usr/local/sony/bin/bootdispi/dsbloadp ]; then
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.tmp
else echo "Unsupported CP Version!"
fi
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr_devarg.elf /dev/mem 0x1D650000 0x1000 > "Lib-PSP iplloader3.5.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader3.5.0_0x80010000.bin.tmp" bs=1 count=3188 of="Lib-PSP iplloader3.5.0_0x80010000.bin"
if [ -f pre-ipl.bin ]; then
dd if=pre-ipl.bin bs=1 count=52 of="Lib-PSP iplloader_full.bin.1.tmp"
echo -ne "\\x74\\x0c" >> "Lib-PSP iplloader_full.bin.1.tmp"
dd if=pre-ipl.bin bs=1 skip=54 count=586 of="Lib-PSP iplloader_full.bin.2.tmp"
cat "Lib-PSP iplloader_full.bin.1.tmp" "Lib-PSP iplloader_full.bin.2.tmp" "Lib-PSP iplloader3.5.0_0x80010000.bin" > "Lib-PSP iplloader_3.5.0.bin"
fi
rm -f *.tmp
fi

rm -f *.tmp
