#include <switch.h>
#include <stdio.h>
#include <stdlib.h>
#include "launcher.hpp"
#include "ui.hpp"

int main(int argc, char **argv) {
    // Init obligatoire
    gfxInitDefault();
    consoleInit(NULL);

    printf("\x1b[1;32mLauncher Switch - Mekanism Edition\x1b[0m\n");
    printf("Appuyez sur (+) pour quitter.\n");

    while(appletMainLoop()) {
        hidScanInput();
        u64 kDown = hidKeysDown(CONTROLLER_P1_AUTO);

        if (kDown & KEY_PLUS) break;

        if (kDown & KEY_A) {
            executeJava("1.16.5", "2500");
        }

        consoleUpdate(NULL);
    }

    gfxExit();
    return 0;
}
