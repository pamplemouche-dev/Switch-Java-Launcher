#include "/opt/devkitpro/libnx/include/switch.h"
#include <stdio.h>
#include <stdlib.h>
#include "../include/launcher.hpp"
#include "../include/ui.hpp"

int main(int argc, char **argv) {
    gfxInitDefault();
    consoleInit(NULL);

    printHeader();
    printMenu();

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
