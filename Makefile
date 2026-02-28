# Chemins forcés
GCC := /opt/devkitpro/devkitA64/bin/aarch64-none-elf-g++
NRO := /opt/devkitpro/tools/bin/elf2nro

all:
	@echo "--- VERIFICATION DES DOSSIERS ---"
	@ls -d /opt/devkitpro/libnx/include || echo "DOSSIER LIBNX INTROUVABLE"
	@echo "--- COMPILATION ---"
	$(GCC) -O2 -Wall -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE \
	-D__SWITCH__ \
	-I/opt/devkitpro/libnx/include \
	test.cpp \
	-specs=/opt/devkitpro/libnx/switch.specs \
	-L/opt/devkitpro/libnx/lib \
	-lnx \
	-o test.elf
	$(NRO) test.elf MonLauncher.nro
