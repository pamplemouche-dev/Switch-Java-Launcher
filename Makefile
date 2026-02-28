GCC := /opt/devkitpro/devkitA64/bin/aarch64-none-elf-g++
NRO := /opt/devkitpro/tools/bin/elf2nro

TARGET := MonLauncher
SOURCES := source/*.cpp
INCLUDES := -Iinclude -I/opt/devkitpro/libnx/include

all:
	@mkdir -p build
	$(GCC) -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE \
	-D__SWITCH__ $(INCLUDES) $(SOURCES) \
	-specs=/opt/devkitpro/libnx/switch.specs \
	-L/opt/devkitpro/libnx/lib -lnx -o $(TARGET).elf
	$(NRO) $(TARGET).elf $(TARGET).nro --name="Mekanism Launcher" --author="Pamplemouche"
