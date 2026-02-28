DEVKITPRO := /opt/devkitpro
CXX       := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-g++
NRO       := $(DEVKITPRO)/tools/bin/elf2nro

TARGET    := MonLauncher
SOURCES   := source/main.cpp source/launcher.cpp source/ui.cpp

# Flags de compilation
CXXFLAGS  := -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE -D__SWITCH__ -Iinclude

# On force l'ordre : Fichiers sources D'ABORD, bibliothèques APRES
LIBS      := -specs=$(DEVKITPRO)/libnx/switch.specs -L$(DEVKITPRO)/libnx/lib -lnx

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	$(NRO) $< $@ --name="Mekanism" --author="Dev"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $(SOURCES) -o $@ $(LIBS)

clean:
	rm -rf build *.elf *.nro
