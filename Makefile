DEVKITPRO := /opt/devkitpro
CXX       := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-g++
NRO       := $(DEVKITPRO)/tools/bin/elf2nro

TARGET    := MonLauncher
SOURCES   := source/main.cpp source/launcher.cpp source/ui.cpp

# On garde juste les dossiers essentiels
CXXFLAGS  := -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE -D__SWITCH__ -Iinclude
LDFLAGS   := -specs=$(DEVKITPRO)/libnx/switch.specs -L$(DEVKITPRO)/libnx/lib -lnx

all:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $(SOURCES) $(LDFLAGS) -o $(TARGET).elf
	$(NRO) $(TARGET).elf $(TARGET).nro --name="Mekanism"

clean:
	rm -rf build *.elf *.nro
