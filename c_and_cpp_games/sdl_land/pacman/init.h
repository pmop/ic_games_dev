#ifndef INIT_H
#define INIT_H

#include <SDL2/SDL.h>
#include "defs.h"

enum GameState {
    QUIT, MENU, PLAYING, WIN, LOST, RESET
};

typedef struct GameScreen {
    SDL_Window *window;
    SDL_Renderer *renderer;
    enum GameState state;
} GameScreen;

#endif


