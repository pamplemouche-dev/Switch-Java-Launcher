#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// --- DÉFINITIONS SYSTÈME SWITCH (AUTO-CONTENU) ---
#ifdef __cplusplus
extern "C" {
#endif
    typedef uint64_t u64;
    typedef uint32_t u32;

    void gfxInitDefault(void);
    void gfxExit(void);
    void consoleInit(void*);
    void consoleUpdate(void*);
    void hidScanInput(void);
    u64 hidKeysDown(int);
    bool appletMainLoop(void);

    // Pour éviter les erreurs de liens sur certaines versions
    void gfxFlushBuffers(void);
    void gfxSwapBuffers(void);
#ifdef __cplusplus
}
#endif

#define CONTROLLER_P1_AUTO 10
#define KEY_PLUS (1 << 10)
#define KEY_A (1 << 0)
// -----------------------------------------------

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
