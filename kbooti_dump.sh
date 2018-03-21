#!/bin/sh

Version=/var/lib/toolupdate/toolupdate.version

rm -f kbootitmp
rm -f kbootidmp.bin
rm *.tmp
if grep '1.0.0' $Version;then
#bootdispi='/usr/local/sony/bin/bootdispi'

#CP Version 1.00

#0.4.0
if [ -f kbooti_040.bin ]; then
dd if=kbooti_040.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0xbfc.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.bin
#/usr/local/sony/bin/bootdispi/dspreset
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader0.4.0.bin.tmp"
dd if="Lib-PSP iplloader0.4.0.bin.tmp" bs=1 count=1472 of="Lib-PSP iplloader0.4.0.bin"
rm -f kbootidmp.bin
fi

#0.6.0
if [ -f kbooti_060.bin ]; then
dd if=kbooti_060.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0xbfc.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader0.6.0.bin.tmp"
dd if="Lib-PSP iplloader0.6.0.bin.tmp" bs=1 count=1872 of="Lib-PSP iplloader0.6.0.bin"
rm -f kbootidmp.bin
fi

#0.7.0
if [ -f kbooti_070.bin ]; then
dd if=kbooti_070.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0x8001.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader0.7.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader0.7.0_0x80010000.bin.tmp" bs=1 count=2196 of="Lib-PSP iplloader0.7.0_0x80010000.bin"
rm -f kbootidmp.bin
fi

#0.9.0
if [ -f kbooti_090.bin ]; then
dd if=kbooti_090.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0x8001.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader0.9.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader0.9.0_0x80010000.bin.tmp" bs=1 count=2196 of="Lib-PSP iplloader0.9.0_0x80010000.bin"
rm -f kbootidmp.bin
fi

#2.6.0
if [ -f kbooti_260.bin ]; then
dd if=kbooti_260.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0x8001.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader2.6.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader2.6.0_0x80010000.bin.tmp" bs=1 count=3060 of="Lib-PSP iplloader2.6.0_0x80010000.bin"
rm -f kbootidmp.bin
fi

#2.7.1
if [ -f kbooti_271.bin ]; then
dd if=kbooti_271.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0x8001.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dstdb -nokbd -Force bloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset &>/dev/null &
sleep 10
pkill dspreset
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader2.7.1_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader2.7.1_0x80010000.bin.tmp" bs=1 count=3060 of="Lib-PSP iplloader2.7.1_0x80010000.bin"
rm -f kbootidmp.bin
fi
fi

rm *.tmp

if grep '5.00' $Version;then
#CP Version 5.00


#0.4.0
if [ -f kbooti_040.bin ]; then
dd if=kbooti_040.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0xbfc.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset -nowait &>/dev/null &
pkill dspreset
sleep 5
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader0.4.0.bin.tmp"
dd if="Lib-PSP iplloader0.4.0.bin.tmp" bs=1 count=1472 of="Lib-PSP iplloader0.4.0.bin"
rm -f kbootidmp.bin
fi

#0.6.0
if [ -f kbooti_060.bin ]; then
dd if=kbooti_060.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0xbfc.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset -nowait &>/dev/null &
pkill dspreset
sleep 5
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader0.6.0.bin.tmp"
dd if="Lib-PSP iplloader0.6.0.bin.tmp" bs=1 count=1872 of="Lib-PSP iplloader0.6.0.bin"
rm -f kbootidmp.bin
fi

#0.7.0
if [ -f kbooti_070.bin ]; then
dd if=kbooti_070.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0x8001.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset -nowait &>/dev/null &
pkill dspreset
sleep 5
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader0.7.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader0.7.0_0x80010000.bin.tmp" bs=1 count=2196 of="Lib-PSP iplloader0.7.0_0x80010000.bin"
rm -f kbootidmp.bin
fi

#0.9.0
if [ -f kbooti_090.bin ]; then
dd if=kbooti_090.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0x8001.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset -nowait &>/dev/null &
pkill dspreset
sleep 5
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader0.9.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader0.9.0_0x80010000.bin.tmp" bs=1 count=2196 of="Lib-PSP iplloader0.9.0_0x80010000.bin"
rm -f kbootidmp.bin
fi

#2.6.0
if [ -f kbooti_260.bin ]; then
dd if=kbooti_260.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0x8001.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset -nowait &>/dev/null &
pkill dspreset
sleep 5
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader2.6.0_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader2.6.0_0x80010000.bin.tmp" bs=1 count=3060 of="Lib-PSP iplloader2.6.0_0x80010000.bin"
rm -f kbootidmp.bin
fi

#2.7.1
if [ -f kbooti_271.bin ]; then
dd if=kbooti_271.bin bs=1 count=4096 of=kbootitmp
cat kbootitmp ipl_0x8001.bin > kbootidmp.bin
rm -f kbootitmp
/usr/local/sony/bin/bootdispi/dsbloadp kbootidmp.bin
nohup /usr/local/sony/bin/bootdispi/dspreset -nowait &>/dev/null &
pkill dspreset
sleep 5
./dump_cp_addr.elf 0x1D650000 0x1000 > "Lib-PSP iplloader2.7.1_0x80010000.bin.tmp"
dd if="Lib-PSP iplloader2.7.1_0x80010000.bin.tmp" bs=1 count=3060 of="Lib-PSP iplloader2.7.1_0x80010000.bin"
rm -f kbootidmp.bin
fi

fi
rm *.tmp