# Outils
CXX      := /opt/devkitpro/devkitA64/bin/aarch64-none-elf-g++
ELF2NRO  := /opt/devkitpro/tools/bin/elf2nro

# Cibles
TARGET   := MonLauncher
SOURCES  := source/main.cpp source/launcher.cpp source/ui.cpp

all:
	@mkdir -p build
	$(CXX) -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE \
	-D__SWITCH__ -Iinclude -I/opt/devkitpro/libnx/include \
	$(SOURCES) \
	-specs=/opt/devkitpro/libnx/switch.specs \
	-L/opt/devkitpro/libnx/lib -lnx -o $(TARGET).elf
	$(ELF2NRO) $(TARGET).elf $(TARGET).nro --name="Mekanism Launcher"

clean:
	rm -rf build *.elf *.nro
