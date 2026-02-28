# Chemins officiels devkitPro
include $(DEVKITPRO)/libnx/switch_rules

TARGET := MonLauncher
SOURCES := source

# Options de compilation forcées
CXX := aarch64-none-elf-g++
CXXFLAGS := -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE -I$(LIBNX)/include -Iinclude -D__SWITCH__
LDFLAGS := -specs=$(DEVKITPRO)/libnx/switch.specs -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -Wl,-Map,$(TARGET).map -L$(LIBNX)/lib -lnx

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	@elf2nro $< $@ --name="$(TARGET)" --author="Dev" --version="1.0.0"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $(SOURCES)/*.cpp $(LDFLAGS) -o $@

clean:
	rm -rf build $(TARGET).elf $(TARGET).nro $(TARGET).map
