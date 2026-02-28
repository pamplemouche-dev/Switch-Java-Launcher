# On définit le point d'entrée de devkitPro
DEVKITPRO := /opt/devkitpro
DEVKITA64 := $(DEVKITPRO)/devkitA64

# Outils
CXX      := $(DEVKITA64)/bin/aarch64-none-elf-g++
NRO      := $(DEVKITPRO)/tools/bin/elf2nro

# Dossiers du projet
export INCLUDE := include
export SOURCE  := source
export LIBNX   := $(DEVKITPRO)/libnx

# Nom du projet
TARGET := MonLauncher

# Flags de compilation
# -isystem dit au compilateur : "Ceci est une bibliothèque système, cherche dedans en priorité"
CXXFLAGS := -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE \
            -D__SWITCH__ \
            -isystem $(LIBNX)/include \
            -I$(INCLUDE)

# Flags de lien
LDFLAGS  := -specs=$(LIBNX)/switch.specs -L$(LIBNX)/lib -lnx

# Fichiers sources (on les liste un par un pour éviter les erreurs de wildcard)
SRCS := $(SOURCE)/main.cpp $(SOURCE)/launcher.cpp $(SOURCE)/ui.cpp

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	$(NRO) $< $@ --name="Mekanism" --author="Dev"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $(SRCS) $(LDFLAGS) -o $@

clean:
	rm -rf build *.elf *.nro
