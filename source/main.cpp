C++
#include <switch.h>     // INDISPENSABLE EN PREMIER
#include <stdio.h>
#include <stdlib.h>

#include "launcher.hpp"
#include "ui.hpp" // On ajoute l'UI

int main(int argc, char **argv) {
    gfxInitDefault();
    consoleInit(NULL);

    prepareSystemForJava();

    // Affichage initial
    drawHeader();
    drawMenu();

    while(appletMainLoop()) {
        hidScanInput();
        u64 kDown = hidKeysDown(CONTROLLER_P1_AUTO);

        if (kDown & KEY_PLUS) break; 

        if (kDown & KEY_A) {
            showStatus("Preparation de Mekanism...");
            executeJava("1.16.5", "2500");
        }

        if (kDown & KEY_X) {
            showStatus("Lancement version 1.20.1...");
            executeJava("1.20.1", "2500");
        }

        if (kDown & KEY_Y) {
            showStatus("Nettoyage en cours...");
            // Logique de nettoyage ici
        }

        consoleUpdate(NULL);
    }

    gfxExit();
    return 0;
}
