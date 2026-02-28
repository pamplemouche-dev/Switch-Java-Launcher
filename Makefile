#---------------------------------------------------------------------------------
# TARGET est le nom de ton fichier final (MonLauncher.nro)
#---------------------------------------------------------------------------------
TARGET      :=  MonLauncher
BUILD       :=  build
SOURCES     :=  source
INCLUDES    :=  include
DATA        :=  data
GRAPHICS    :=  assets
ROMFS       :=  romfs

# Paramètres de l'application pour la Switch
APP_TITLE   :=  Java Launcher Switch
APP_AUTHOR  :=  TonPseudo
APP_VERSION :=  1.0.0

#---------------------------------------------------------------------------------
# Ne pas modifier sous cette ligne sauf si tu sais ce que tu fais
#---------------------------------------------------------------------------------
ifeq ($(strip $(DEVKITPRO)),)
$(error "S'il vous plaît, installez devkitPro !")
endif

include $(DEVKITPRO)/libnx/switch_rules

# Options de compilation
CFLAGS      :=  -g -Wall -O2 -ffunction-sections \
                $(ARCH) $(DEFINES) -I$(CURDIR)/$(INCLUDES) -I$(LIBNX)/include
CXXFLAGS    :=  $(CFLAGS) -fno-rtti -fno-exceptions
LDFLAGS     :=  -specs=$(DEVKITPRO)/libnx/switch.specs $(ARCH) -Wl,-Map,$(notdir $*.map)

LIBS        :=  -lnx

# Règle principale
all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf

$(TARGET).elf: $(SOURCES)
