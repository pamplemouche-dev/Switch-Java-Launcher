#ifndef UI_HPP
#define UI_HPP

#include <switch.h>

// Couleurs (Format RGBA8)
#define CLR_BG      0xFF2D2D2D // Gris foncé
#define CLR_TEXT    0xFFFFFFFF // Blanc
#define CLR_ACCENT  0xFF00FF00 // Vert (pour Mekanism)

// Fonctions d'affichage
void drawHeader();
void drawMenu();
void showStatus(const char* message);

#endif
