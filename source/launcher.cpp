#ifndef LAUNCHER_HPP
#define LAUNCHER_HPP

#include <switch.h>

// Alloue la RAM et prépare les services
void prepareSystemForJava();

// Execute le moteur java avec les paramètres choisis
void executeJava(const char* version, const char* ram);

#endif
