#include "launcher.hpp"
#include <stdio.h>
#include <stdlib.h>

// On définit la taille de la RAM disponible pour l'application (3 Go)
u32 __nx_applet_heap_size = 0xC0000000; 

void prepareSystemForJava() {
    // Désactive la mise en veille auto pendant que le launcher tourne
    appletSetFocusHandlingMode(AppletFocusHandlingMode_NoSuspend);
}

void executeJava(const char* version, const char* ram) {
    // Construction de la ligne de commande pour lancer Minecraft
    // On part du principe que la JRE est dans /bin/java sur la SD
    char cmd[1024];
    snprintf(cmd, sizeof(cmd), 
             "sdmc:/switch/MonLauncher/bin/java -Xmx%sM -Xms%sM "
             "-jar sdmc:/switch/MonLauncher/.minecraft/versions/%s.jar", 
             ram, ram, version);

    printf("[EXEC] Lancement en cours...\n");
    
    // Appel du moteur Java
    int result = system(cmd);

    if (result != 0) {
        printf("[ERREUR] Le moteur Java a quitte avec le code : %d\n", result);
    }
}
