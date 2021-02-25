#include "Application.h"
#include "Engine.h"

#if 1
int main(int argc, char* argv[])
{
    Application app;
    return app.run();
}

#else
#include "SDL2/SDL.h"
#include "SDL2/SDL_ttf.h"
#include "SDL2/SDL_image.h"
int main(int argc, char* argv[])
{
    SDL_Window *window;
	SDL_Renderer* g_renderer;

 
	/*av_register_all();*/
	//LOGI("%s\n", avcodec_configuration());

	
	if(SDL_CreateWindowAndRenderer(768, 480, 0, &window, &g_renderer) < 0)
		exit(2);
	
    
#if 0
	window = SDL_CreateWindow("JY_LLK",
		SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
		1280, 800,
		0);

	g_renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_PRESENTVSYNC);
 #endif

	SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "1");
    SDL_Surface* temp;
    temp = SDL_LoadBMP("C:\\Users\\sf\\Desktop\\60.bmp");
  

	/* Main render loop */
	Uint8 done = 0;
	SDL_Event event;
	while (!done)
	{
		/* Check for events */
		while (SDL_PollEvent(&event))
		{
			if (event.type == SDL_QUIT || event.type == SDL_KEYDOWN || event.type == SDL_FINGERDOWN)
			{
				done = 1;
			}
		}


		/* Draw a gray background
		SDL_SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF);
		SDL_RenderClear(renderer);*/

		draw(window, g_renderer, sprite);

		/* Update the screen! */
		SDL_RenderPresent(g_renderer);

		SDL_Delay(10);
	}

	exit(0);
}

#endif