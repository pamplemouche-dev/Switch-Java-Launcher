# --- CONFIGURATION DES CHEMINS (NE PAS MODIFIER) ---
DEVKITPRO := /opt/devkitpro
DEVKITA64 := $(DEVKITPRO)/devkitA64
LIBNX     := $(DEVKITPRO)/libnx

# Outils de compilation
CXX      := $(DEVKITA64)/bin/aarch64-none-elf-g++
ELF2NRO  := $(DEVKITPRO)/tools/bin/elf2nro

# Nom de ton application
TARGET   := MonLauncher

# --- OPTIONS DE COMPILATION ---
# On force l'inclusion de TOUS les dossiers nécessaires
INCLUDES := -Iinclude -I$(LIBNX)/include -I$(DEVKITPRO)/libnx/include

# Flags pour l'architecture de la Switch (Cortex-A57)
ARCH     := -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE

# Flags du compilateur
# -D__SWITCH__ est crucial pour activer le code spécifique à la console
CXXFLAGS := -O2 -Wall $(ARCH) $(INCLUDES) -D__SWITCH__ -fno-rtti -fno-exceptions

# Flags du Linker (C'est ici qu'on soude les bibliothèques)
# L'ordre compte : -lnx doit TOUJOURS être à la fin
LDFLAGS  := -specs=$(LIBNX)/switch.specs $(ARCH) -L$(LIBNX)/lib -lnx

# --- ETAPES DE CONSTRUCTION ---

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	@echo "Conversion de l'ELF en NRO..."
	@$(ELF2NRO) $< $@ --name="$(TARGET)" --author="Dev" --version="1.0.0"
	@echo "Terminé ! Fichier $(TARGET).nro généré."

$(TARGET).elf:
	@mkdir -p build
	@echo "Compilation des fichiers sources..."
	$(CXX) $(CXXFLAGS) source/*.cpp $(LDFLAGS) -o $@

clean:
	rm -rf build $(TARGET).elf $(TARGET).nro
