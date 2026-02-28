#include "ui.hpp"
#include <stdio.h>

void drawHeader() {
    // On utilise des codes ANSI pour colorer le texte dans la console Switch
    printf("\x1b[42m\x1b[30m   SWITCH JAVA LAUNCHER - MEKANISM EDITION   \x1b[0m\n\n");
}

void drawMenu() {
    printf("\x1b[32m[A]\x1b[0m Lancer Minecraft 1.16.5 + Mekanism\n");
    printf("\x1b[32m[X]\x1b[0m Lancer Minecraft 1.20.1\n");
    printf("\x1b[33m[Y]\x1b[0m Nettoyer le cache (.tmp)\n");
    printf("\x1b[31m[+]\x1b[0m Quitter le launcher\n");
    printf("\n--------------------------------------------\n");
}

void showStatus(const char* message) {
    printf("\x1b[37m[STATUS] %s\x1b[0m\n", message);
}
