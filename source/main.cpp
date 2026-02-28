#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// On force le compilateur à garder les noms EXACTS pour le Linker
#ifdef __cplusplus
extern "C" {
#endif

    typedef uint64_t u64;

    // Déclarations des fonctions Vitales de la Switch
    void gfxInitDefault(void);
    void gfxExit(void);
    void consoleInit(void*);
    void consoleUpdate(void*);
    void hidScanInput(void);
    u64 hidKeysDown(int);
    bool appletMainLoop(void);

#ifdef __cplusplus
}
#endif

// Valeurs standard libnx
#define CONTROLLER_P1_AUTO 10
#define KEY_PLUS (1 << 10)
#define KEY_A (1 << 0)

// Inclusion de tes propres fichiers
#include "../include/launcher.hpp"
#include "../include/ui.hpp"

int main(int argc, char **argv) {
    // Initialisation hardware
    gfxInitDefault();
    consoleInit(NULL);

    printHeader();
    printMenu();

    // Boucle d'écoute des touches
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
