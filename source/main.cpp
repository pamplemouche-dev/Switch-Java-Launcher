#include <switch.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    // Initialisation de base
    gfxInitDefault();
    consoleInit(NULL);

    printf("Launcher Switch Java - Pret!\n");
    printf("Appuyez sur (+) pour quitter.\n");

    while(appletMainLoop()) {
        hidScanInput();
        u64 kDown = hidKeysDown(CONTROLLER_P1_AUTO);
        if (kDown & KEY_PLUS) break;
        consoleUpdate(NULL);
    }

    gfxExit();
    return 0;
}
