#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// --- DÉCLARATIONS MANUELLES POUR LA SWITCH ---
// On définit les types et fonctions pour que le compilateur ne bloque pas
extern "C" {
    typedef uint64_t u64;
    
    // Fonctions graphiques et système
    void gfxInitDefault(void);
    void gfxExit(void);
    void consoleInit(void*);
    void consoleUpdate(void*);
    
    // Entrées (Manette)
    void hidScanInput(void);
    u64 hidKeysDown(int);
    
    // Boucle d'application
    bool appletMainLoop(void);
}

// Constantes standard de la libnx
#define CONTROLLER_P1_AUTO 10
#define KEY_PLUS (1 << 10)
#define KEY_A (1 << 0)
// --------------------------------------------

// Tes fichiers locaux
#include "../include/launcher.hpp"
#include "../include/ui.hpp"

int main(int argc, char **argv) {
    // 1. Initialisation de l'affichage et de la console texte
    gfxInitDefault();
    consoleInit(NULL);

    // 2. Affichage de l'interface (depuis ui.cpp)
    printHeader();
    printMenu();

    // 3. Boucle principale (tourne tant que l'app n'est pas fermée)
    while(appletMainLoop()) {
        // Scanner les entrées de la manette
        hidScanInput();
        
        // Récupérer les touches pressées ce tour-ci
        u64 kDown = hidKeysDown(CONTROLLER_P1_AUTO);

        // Bouton (+) pour quitter et revenir au menu Homebrew
        if (kDown & KEY_PLUS) break;

        // Bouton (A) pour lancer la simulation du launcher (depuis launcher.cpp)
        if (kDown & KEY_A) {
            executeJava("1.16.5", "2500");
        }

        // Rafraîchir l'écran
        consoleUpdate(NULL);
    }

    // 4. Nettoyage avant de quitter
    gfxExit();
    return 0;
}
