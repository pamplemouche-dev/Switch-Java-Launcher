DEVKITPRO := /opt/devkitpro
CXX       := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-g++
NRO       := $(DEVKITPRO)/tools/bin/elf2nro

TARGET    := MonLauncher
SOURCES   := source/main.cpp source/launcher.cpp source/ui.cpp

# Flags de compilation
CXXFLAGS  := -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE -D__SWITCH__ -Iinclude

# LIEN MANUEL : On donne le chemin complet vers la libnx.a
# On force aussi l'utilisation du fichier specs avec son chemin complet
LIBS      := -specs=$(DEVKITPRO)/libnx/switch.specs \
             $(DEVKITPRO)/libnx/lib/libnx.a

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	$(NRO) $< $@ --name="Mekanism" --author="Dev"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $(SOURCES) -o $@ $(LIBS)

clean:
	rm -rf build *.elf *.nro
