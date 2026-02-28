#include <switch.h>
#include <stdio.h>
#include "launcher.hpp"

int main(int argc, char **argv) {
    // Initialisation Switch
    gfxInitDefault();
    consoleInit(NULL);

    // On force la RAM au max tout de suite
    prepareSystemForJava();

    printf("\n--- Switch Java Launcher ---\n");
    printf("Pret pour Mekanism.\n\n");
    printf("Appuyez sur (A) pour lancer\n");

    while(appletMainLoop()) {
        hidScanInput();
        u64 kDown = hidKeysDown(CONTROLLER_P1_AUTO);

        if (kDown & KEY_PLUS) break; // Quitter

        if (kDown & KEY_A) {
            executeJava("1.16.5", "2500");
        }

        consoleUpdate(NULL);
    }

    gfxExit();
    return 0;
}
