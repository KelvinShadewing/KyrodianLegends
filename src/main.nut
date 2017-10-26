::main <- function(){
	//Set up the display
	setBackgroundColor(0);
	setScalingFilter(1);
	setWindowTitle("Kyrodian Legends");
	setResolution(320, 180);
	setFPS(60);

	//Set the game mode
	gvGameMode = 0;

	//Run main game loop
	local quit = false;
	while(!quit){
		if(gvGameMode != 0) gvGameMode();
		drawSprite(sprMidiP, 0, mouseX(), mouseY());
		if(keyPress(k_escape)) quit = true;
		
		//Ball test
		if(mousePress(0)){
			newActor(TestBall, mouseX(), mouseY());
			countActors();
		};
		
		runActors();
		update();
	};
};