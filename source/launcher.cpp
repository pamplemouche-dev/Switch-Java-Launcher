#include <switch.h>
#include <stdio.h>
#include "launcher.hpp"

void prepareSystemForJava() {
    // Force la Switch en mode haute performance pour les mods
    appletSetFocusHandlingMode(AppletFocusHandlingMode_NoSuspend);
}

void executeJava(const char* version, const char* ram) {
    // Ici on simule l'appel au moteur Java
    printf("Lancement de Minecraft %s avec %s Mo...\n", version, ram);
}
