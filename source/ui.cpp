#include "ui.hpp"
#include <stdio.h>

void printHeader() {
    printf("\x1b[1;35m====================================\x1b[0m\n");
    printf("\x1b[1;37m      MEKANISM JAVA LAUNCHER        \x1b[0m\n");
    printf("\x1b[1;35m====================================\x1b[0m\n\n");
}

void printMenu() {
    printf("Contrôles :\n");
    printf(" (A) Lancer Minecraft 1.16.5\n");
    printf(" (+) Retour au menu Switch\n\n");
}
