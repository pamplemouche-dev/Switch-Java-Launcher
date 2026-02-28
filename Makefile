# Chemins officiels devkitPro
DEVKITPRO := /opt/devkitpro
DEVKITA64 := $(DEVKITPRO)/devkitA64

# Outils
CXX      := $(DEVKITA64)/bin/aarch64-none-elf-g++
NRO      := $(DEVKITPRO)/tools/bin/elf2nro

# Configuration du projet
TARGET   := MonLauncher
SOURCES  := source/main.cpp source/launcher.cpp source/ui.cpp
INCLUDES := -Iinclude -I$(DEVKITPRO)/libnx/include

# Flags de compilation
# -isystem force le dossier libnx à être traité comme un dossier système
CXXFLAGS := -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE \
            -D__SWITCH__ \
            -isystem $(DEVKITPRO)/libnx/include \
            $(INCLUDES)

# Flags de lien
LDFLAGS  := -specs=$(DEVKITPRO)/libnx/switch.specs -L$(DEVKITPRO)/libnx/lib -lnx

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	$(NRO) $< $@ --name="Mekanism" --author="Dev"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $(SOURCES) $(LDFLAGS) -o $@

clean:
	rm -rf build *.elf *.nro
