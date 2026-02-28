#include "../include/launcher.hpp"
#include <stdio.h>

void executeJava(const char* version, const char* ram) {
    printf("\n\x1b[1;33m[SYSTEM]\x1b[0m RAM: %s Mo\n", ram);
    printf("\x1b[1;32m[SUCCESS]\x1b[0m Minecraft %s lance !\n", version);
}
