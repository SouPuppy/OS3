SRC_DIR = ./src
BUILD_DIR = ./build

NASM = nasm
QEMU = qemu-system-x86_64
BOCHS = bochs
MAKE = make

.PHONY: all build clean run debug boot

all: run

run: $(BUILD_DIR)/os3.img
	$(QEMU) -m 32M -drive file=$(BUILD_DIR)/os3.img,format=raw -boot c

build: $(BUILD_DIR)/os3.img

debug: clean build
	$(BOCHS) -q -f bochsrc.bxrc

boot:
	$(MAKE) -C src/boot BUILD_DIR=../../build/boot

$(BUILD_DIR)/os3.img: boot
	dd if=/dev/zero of=$(BUILD_DIR)/os3.img bs=1M count=5
	dd if=$(BUILD_DIR)/boot/boot.bin of=$(BUILD_DIR)/os3.img bs=512 count=1 seek=0 conv=notrunc

clean:
	rm -f $(BUILD_DIR)/boot/*
	rm -f $(BUILD_DIR)/os3.img
