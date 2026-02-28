// On force le chemin vers la bibliothèque Switch
#include "/opt/devkitpro/libnx/include/switch.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    // Initialisation
    gfxInitDefault();
    consoleInit(NULL);

    printf("Test de compilation forcee...\n");

    while(appletMainLoop()) {
        hidScanInput();
        if (hidKeysDown(CONTROLLER_P1_AUTO) & KEY_PLUS) break;
        consoleUpdate(NULL);
    }

    gfxExit();
    return 0;
}
