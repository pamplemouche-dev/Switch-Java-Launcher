#include <switch.h>
#include <stdio.h>

int main(int argc, char **argv) {
    gfxInitDefault();
    consoleInit(NULL);
    printf("Si tu vois ca, la compilation a REUSSI !\n");
    while(appletMainLoop()) {
        hidScanInput();
        if (hidKeysDown(CONTROLLER_P1_AUTO) & KEY_PLUS) break;
        consoleUpdate(NULL);
    }
    gfxExit();
    return 0;
}
