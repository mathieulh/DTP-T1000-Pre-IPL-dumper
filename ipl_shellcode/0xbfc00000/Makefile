PSPDEV=C:\pspsdk\bin
INCLUDES=-I $(PSPDEV)/../psp/sdk/include

all:	clean patch.bin

patch.bin: 
	$(PSPDEV)/psp-as main.s -o main.o
	$(PSPDEV)/psp-ld -T linkfile.l main.o -o main.elf
	$(PSPDEV)/psp-strip -s main.elf
	$(PSPDEV)/psp-objcopy -O binary main.elf build/0xbfc.bin

clean:
	rm -rf *~ *.o *.elf *.bin build/*.bin
