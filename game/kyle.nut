/*========================================*\
| 	          KYRODIAN LEGENDS             |
|                                          |
| Code License: GPL 3.0                    |
| KyLe Asset License: CC-BY-SA-3.0         |
| Core Asset License: CC-BY-3.0            |
| Music Copyright: Kevin "JazzyPanda" Soto |
| Guest Characters © Respective Owners     |
\*========================================*/


//Standard libs
donut("std/shapes.nut")
donut("std/timelines.nut")

//Run game sources
donut("src/global.nut")
donut("src/assets.nut")
donut("src/menu.nut")
donut("src/intro.nut")
donut("src/title.nut")
//donut("src/debug.nut")
donut("src/physactor.nut")
donut("src/midi.nut")
donut("src/main.nut")

//////////
// MAIN //
//////////

//Set up the display
setBackgroundColor(0)
setScalingFilter(1)
setWindowTitle("Kyrodian Legends")
setResolution(320, 240)
setFPS(30)

//Add resource paths
tileSearchDir.push("res")

//Set the game mode
gvGameMode = gmTitle

//Run main game loop
local quit = false
while(!quit) {
	if(gvGameMode != 0) gvGameMode()
	if(keyPress(k_escape)) quit = true

	runActors()
	update()
}