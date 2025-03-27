SRC_DIR = ./src
BUILD_DIR = ./build

NASM = nasm
QEMU = qemu-system-x86_64
BOCHS = bochs
MAKE = make

.PHONY: all build clean run boot

all: run

run: os3.img
	$(QEMU) -m 32M -drive file=os3.img,format=raw -boot c

build: os3.img

boot:
	$(MAKE) -C src/boot BUILD_DIR=../../build/boot

os3.img: boot
	dd if=/dev/zero of=os3.img bs=1M count=5
	dd if=$(BUILD_DIR)/boot/boot.bin of=os3.img bs=512 count=1 seek=0 conv=notrunc

clean:
	rm -f $(BUILD_DIR)/boot/*
	rm -f os3.img
