#include <switch.h>
#include <stdio.h>
#include <stdlib.h>

#include "launcher.hpp"
#include "ui.hpp"

int main(int argc, char **argv) {
    gfxInitDefault();
    consoleInit(NULL);

    printHeader(); // Affiche le titre Mekanism
    printMenu();   // Affiche les contrôles

    while(appletMainLoop()) {
        hidScanInput();
        u64 kDown = hidKeysDown(CONTROLLER_P1_AUTO);

        if (kDown & KEY_PLUS) break; // Quitter

        if (kDown & KEY_A) {
            // Lance Minecraft avec les réglages Mekanism
            executeJava("1.16.5", "2500"); 
        }

        consoleUpdate(NULL);
    }

    gfxExit();
    return 0;
}
