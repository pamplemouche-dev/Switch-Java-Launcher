# Chemins fixes pour GitHub Actions
DEVKITPRO := /opt/devkitpro
DEVKITARM  := $(DEVKITPRO)/devkitARM
DEVKITA64  := $(DEVKITPRO)/devkitA64
LIBNX      := $(DEVKITPRO)/libnx

# On inclut les règles de base
include $(LIBNX)/switch_rules

TARGET := MonLauncher
SOURCES := source

# Options de compilation avec chemins FORCÉS
CXX      := $(DEVKITA64)/bin/aarch64-none-elf-g++
CXXFLAGS := -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE \
            -I$(LIBNX)/include -Iinclude -D__SWITCH__

# LDFLAGS : L'ordre est CRUCIAL, -lnx doit être à la fin
LDFLAGS  := -specs=$(LIBNX)/switch.specs -march=armv8-a+crc+crypto -mtune=cortex-a57 \
            -mtp=soft -L$(LIBNX)/lib -lnx

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	@$(DEVKITPRO)/tools/bin/elf2nro $< $@ --name="Launcher" --author="Dev" --version="1.0.0"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $(SOURCES)/*.cpp $(LDFLAGS) -o $@

clean:
	rm -rf build $(TARGET).elf $(TARGET).nro
