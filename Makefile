# Chemins fixes du container devkitPro sur GitHub
GCC := /opt/devkitpro/devkitA64/bin/aarch64-none-elf-g++
NRO := /opt/devkitpro/tools/bin/elf2nro

# Cibles
TARGET := MonLauncher
SOURCES := source/main.cpp source/launcher.cpp source/ui.cpp

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	$(NRO) $(TARGET).elf $(TARGET).nro --name="JavaLauncher" --author="Dev"

$(TARGET).elf:
	@mkdir -p build
	$(GCC) -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE \
	-D__SWITCH__ \
	-I/opt/devkitpro/libnx/include \
	-Iinclude \
	$(SOURCES) \
	-specs=/opt/devkitpro/libnx/switch.specs \
	-L/opt/devkitpro/libnx/lib \
	-lnx \
	-o $(TARGET).elf

clean:
	rm -rf build $(TARGET).elf $(TARGET).nro
