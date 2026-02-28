# Vérification de devkitPro
ifeq ($(strip $(DEVKITPRO)),)
$(error "S'il vous plaît, installez devkitPro !")
endif

# Inclusion des règles officielles de devkitPro
include $(DEVKITPRO)/libnx/switch_rules

# Définition des dossiers
TARGET      :=  MonLauncher
SOURCES     :=  source
INCLUDES    :=  include
BUILD       :=  build

# Configuration des outils de compilation
CC      := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-gcc
CXX     := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-g++
OBJCOPY := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-objcopy

# Flags de compilation (AJOUT DES PATHS LIBNX)
I_FLAGS     := -I$(CURDIR)/$(INCLUDES) -I$(LIBNX)/include
CFLAGS      := -g -Wall -O2 -ffunction-sections $(ARCH) $(I_FLAGS) -D__SWITCH__
CXXFLAGS    := $(CFLAGS) -fno-rtti -fno-exceptions
LDFLAGS := -specs=$(DEVKITPRO)/libnx/switch.specs $(ARCH) -L$(LIBNX)/lib -lnx

# Bibliothèques à lier
LIBS    := -lnx

# --- LOGIQUE DE BUILD ---

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	@$(DEVKITPRO)/tools/bin/elf2nro $< $@ --name="$(TARGET)" --author="Dev" --version="1.0.0"

$(TARGET).elf:
	@mkdir -p $(BUILD)
	$(CXX) $(CXXFLAGS) $(SOURCES)/*.cpp $(LDFLAGS) $(LIBS) -o $@

clean:
	rm -rf $(BUILD) $(TARGET).elf $(TARGET).nro
