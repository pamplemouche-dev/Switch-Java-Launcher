# --- CHEMINS FIXES DEVKITPRO ---
DEVKITPRO := /opt/devkitpro
DEVKITA64 := $(DEVKITPRO)/devkitA64
LIBNX     := $(DEVKITPRO)/libnx

# Outils
CXX      := $(DEVKITA64)/bin/aarch64-none-elf-g++
ELF2NRO  := $(DEVKITPRO)/tools/bin/elf2nro

# --- INSTALLATION DES BIBLIOTHEQUES DANS LE COMPILATEUR ---
# -I : Cherche les fichiers .h (la notice)
# -L : Cherche les fichiers .a (le moteur)
# -lnx : Installe la bibliothèque principale de la Switch
I_FLAGS  := -I$(LIBNX)/include -Iinclude
L_FLAGS  := -L$(LIBNX)/lib -specs=$(LIBNX)/switch.specs

CXXFLAGS := -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE $(I_FLAGS) -D__SWITCH__
LDFLAGS  := $(L_FLAGS) -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -lnx

TARGET   := MonLauncher
SOURCES  := source

# --- CONSTRUCTION ---

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	@$(ELF2NRO) $< $@ --name="JavaLauncher" --author="Dev"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $(SOURCES)/*.cpp $(LDFLAGS) -o $@

clean:
	rm -rf build $(TARGET).elf $(TARGET).nro
