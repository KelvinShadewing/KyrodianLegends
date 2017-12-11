//////////
// MAIN //
//////////

::main <- function(){
	//Set up the display
	setBackgroundColor(0);
	setScalingFilter(1);
	setWindowTitle("Kyrodian Legends");
	setResolution(400, 240);
	setFPS(60);

	//Set the game mode
	gvGameMode = 0;
	newActor(Midi, 64, 120);

	//Run main game loop
	local quit = false;
	while(!quit){
		if(gvGameMode != 0) gvGameMode();
		if(keyPress(k_escape)) quit = true;

		runActors();
		update();
	};
};
