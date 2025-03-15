NASM = nasm
QEMU = qemu-system-x86_64
BOCHS = bochs

.PHONY: all clean run debug

all: boot.bin

run: os3.img
	$(QEMU) -m 32M -drive file=os3.img,format=raw -boot c

debug: os3.img
	$(BOCHS) -f bochsrc.txt -q

boot.bin: boot.asm
	nasm -f bin -o boot.bin boot.asm

os3.img: boot.bin
	dd if=/dev/zero of=os3.img bs=1M count=5
	dd if=boot.bin of=os3.img bs=512 count=1 seek=0 conv=notrunc



clean:
	rm boot.bin
	rm os3.img

