#include "launcher.hpp"
#include <stdio.h>

void executeJava(const char* version, const char* ram) {
    printf("\x1b[1;33m[SYSTEM]\x1b[0m Allocation de %s Mo de RAM...\n", ram);
    printf("\x1b[1;33m[SYSTEM]\x1b[0m Chargement des bibliothèques LWJGL...\n");
    
    // Simulation du lancement de l'OpenJDK
    printf("\x1b[1;32m[SUCCESS]\x1b[0m Minecraft %s (Mekanism Modded) lancé !\n", version);
    printf("Redirection vers l'écran de jeu...\n");
}
