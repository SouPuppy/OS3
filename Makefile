NASM = nasm
QEMU = qemu-system-x86_64
BOCHS = bochs
MAKE = make

.PHONY: all build clean run debug

all: 
	$(MAKE) run

run: os3.img
	$(QEMU) -m 32M -drive file=os3.img,format=raw -boot c

build: os3.img

debug:
	$(MAKE) clean
	$(MAKE) build
	$(BOCHS) -q -f bochsrc.bxrc

boot.bin: boot.asm
	nasm -f bin -o boot.bin boot.asm

os3.img: boot.bin
	dd if=/dev/zero of=os3.img bs=1M count=5
	dd if=boot.bin of=os3.img bs=512 count=1 seek=0 conv=notrunc

clean:
	rm -f boot.bin
	rm -f os3.img*
