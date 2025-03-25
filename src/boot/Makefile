NASM = nasm
NDISASM = ndisasm
BUILD_DIR ?= ../build/boot

.PHONY: all

all: $(BUILD_DIR)/boot.bin $(BUILD_DIR)/boot.dump

$(BUILD_DIR)/boot.bin: boot.asm
	@mkdir -p $(BUILD_DIR)
	$(NASM) -f bin -o $@ $<

$(BUILD_DIR)/boot.dump: $(BUILD_DIR)/boot.bin
	$(NDISASM) -b 16 $< > $@
