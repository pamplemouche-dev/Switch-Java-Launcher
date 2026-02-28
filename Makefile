include $(DEVKITPRO)/libnx/switch_rules

TARGET := MonLauncher
SOURCES := source
INCLUDES := include

# On simplifie au maximum
CXX := aarch64-none-elf-g++
LDFLAGS := -specs=$(DEVKITPRO)/libnx/switch.specs $(ARCH) -L$(LIBNX)/lib

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	@elf2nro $< $@ --name="$(TARGET)"

$(TARGET).elf:
	@mkdir -p build
	$(CXX) -O2 -Wall -I$(INCLUDES) -I$(LIBNX)/include $(ARCH) -D__SWITCH__ $(SOURCES)/*.cpp $(LDFLAGS) -lnx -o $@

clean:
	rm -rf build $(TARGET).elf $(TARGET).nro
