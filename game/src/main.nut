//////////
// MAIN //
//////////

::main <- function(){
	//Set up the display
	setBackgroundColor(0);
	setScalingFilter(1);
	setWindowTitle("Kyrodian Legends");
	setResolution(320, 240);
	setFPS(30);

	//Set the game mode
	gvGameMode = 0;
	newActor(Midi, 64, 120);
	newTimeline(tlTest);

	//Run main game loop
	local quit = false;
	while(!quit){
		if(gvGameMode != 0) gvGameMode();
		if(keyPress(k_escape)) quit = true;

		runActors();
		update();
	};
};
