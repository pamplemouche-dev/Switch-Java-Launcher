# Chemins forcés
DEVKITPRO := /opt/devkitpro
LIBNX     := $(DEVKITPRO)/libnx
DEVKITA64 := $(DEVKITPRO)/devkitA64

# Vérification immédiate
ifeq ($(wildcard $(LIBNX)/include/switch.h),)
$(error ERREUR : La bibliotheque libnx est introuvable dans $(LIBNX))
endif

# Outils
CXX      := $(DEVKITA64)/bin/aarch64-none-elf-g++
ELF2NRO  := $(DEVKITPRO)/tools/bin/elf2nro

# Configuration
TARGET   := MonLauncher
SOURCES  := source
INC_DIRS := -Iinclude -I$(LIBNX)/include

# Flags de l'architecture Switch
ARCH     := -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE

CXXFLAGS := -O2 -Wall $(ARCH) $(INC_DIRS) -D__SWITCH__
LDFLAGS  := -specs=$(LIBNX)/switch.specs $(ARCH) -L$(LIBNX)/lib -lnx

# --- REGLES ---

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	$(ELF2NRO) $< $@ --name="JavaLauncher"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $(SOURCES)/*.cpp $(LDFLAGS) -o $@

clean:
	rm -rf build $(TARGET).elf $(TARGET).nro
