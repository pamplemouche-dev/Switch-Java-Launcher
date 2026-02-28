#include "../include/ui.hpp"
#include <stdio.h>

void printHeader() {
    printf("\x1b[1;35m====================================\x1b[0m\n");
    printf("\x1b[1;37m      MEKANISM JAVA LAUNCHER        \x1b[0m\n");
    printf("\x1b[1;35m====================================\x1b[0m\n\n");
}

void printMenu() {
    printf("Appuyez sur (A) pour Minecraft\n");
    printf("Appuyez sur (+) pour quitter\n\n");
}
