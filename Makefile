# Chemins vers les outils Switch officiels
CXX      := /opt/devkitpro/devkitA64/bin/aarch64-none-elf-g++
ELF2NRO  := /opt/devkitpro/tools/bin/elf2nro

# Nom du projet
TARGET   := MonLauncher

# Options de compilation (FORCE l'inclusion des headers libnx)
# Le flag -isystem est plus puissant que -I pour les libs système
CXXFLAGS := -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE \
            -D__SWITCH__ \
            -isystem /opt/devkitpro/libnx/include \
            -Iinclude

# Options de lien (Lien avec la bibliothèque libnx)
LDFLAGS  := -specs=/opt/devkitpro/libnx/switch.specs -L/opt/devkitpro/libnx/lib -lnx

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	$(ELF2NRO) $< $@ --name="Mekanism Launcher" --author="Dev"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) source/*.cpp $(LDFLAGS) -o $@

clean:
	rm -rf build $(TARGET).elf $(TARGET).nro
