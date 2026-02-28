#include <switch.h>
#include <stdio.h>
#include <stdlib.h>

// On inclut tes fichiers
#include "launcher.hpp"
#include "ui.hpp"

// Sécurité pour s'assurer que libnx est bien liée
extern "C" {
    void userAppInit(void) {
        // Laisser vide
    }
}

int main(int argc, char **argv) {
    // Initialisation des graphismes et de la console
    gfxInitDefault();
    consoleInit(NULL);

    printf("\x1b[1;32m--- Launcher Mekanism Operationnel ---\x1b[0m\n\n");
    printf("Utilisez les Joy-Cons pour naviguer.\n");

    while(appletMainLoop()) {
        // Scan des entrées (boutons)
        hidScanInput();
        u64 kDown = hidKeysDown(CONTROLLER_P1_AUTO);

        if (kDown & KEY_PLUS) break; // Quitter

        if (kDown & KEY_A) {
            printf("Lancement Minecraft 1.16.5...\n");
            executeJava("1.16.5", "2500");
        }

        consoleUpdate(NULL);
    }

    gfxExit();
    return 0;
}
