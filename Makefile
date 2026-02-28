# On définit explicitement les outils devkitPro
ifeq ($(strip $(DEVKITPRO)),)
$(error "S'il vous plaît, installez devkitPro !")
endif

include $(DEVKITPRO)/libnx/switch_rules

# FORCE l'utilisation du compilateur Switch
CC      := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-gcc
CXX     := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-g++
LD      := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-gcc

TARGET      :=  MonLauncher
BUILD       :=  build
SOURCES     :=  source
INCLUDES    :=  include
assets      :=  assets

APP_TITLE   :=  Java Launcher Switch
APP_AUTHOR  :=  TonPseudo
APP_VERSION :=  1.0.0

# Options de compilation corrigées
CFLAGS      :=  -g -Wall -O2 -ffunction-sections \
                $(ARCH) $(DEFINES) -I$(CURDIR)/$(INCLUDES) -I$(LIBNX)/include
CXXFLAGS    :=  $(CFLAGS) -fno-rtti -fno-exceptions
LDFLAGS     :=  -specs=$(DEVKITPRO)/libnx/switch.specs $(ARCH) -Wl,-Map,$(notdir $*.map)

LIBS        :=  -lnx

# --- REGLES ---

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf

$(TARGET).elf: $(SOURCES)
	@mkdir -p $(BUILD)
	$(CXX) $(CXXFLAGS) $(SOURCES)/*.cpp $(LDFLAGS) $(LIBS) -o $@

clean:
	rm -rf $(BUILD) $(TARGET).elf $(TARGET).nro
